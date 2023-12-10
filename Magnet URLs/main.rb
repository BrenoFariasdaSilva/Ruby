require "selenium-webdriver" # Import the Selenium Webdriver gem
require "nokogiri" # Import the Nokogiri gem
require "csv" # Import the CSV gem
require "rbconfig" # Import the RbConfig gem
require "ruby-progressbar" # Import the Ruby Progressbar gem

# This method returns the path to the geckodriver executable
def get_geckodriver_path
   os = RbConfig::CONFIG["host_os"] # Get the host operating system

   case os # Detect the operating system
   when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      # Windows
      return "path/to/geckodriver.exe"
   when /darwin|mac os/
      # macOS
      return "/path/to/geckodriver"
   when /linux/
      # Linux
      return "/snap/bin/geckodriver" # Specify the path to geckodriver executable
   else
      puts "Unsupported operating system: #{os}"
      return nil
   end
end

# This method returns true if the URLs are sorted alphabetically, otherwise false
def sorted_alphabetically?(urls)
   names = urls.map { |url| get_name_from_url(url) }
   names == names.sort
end

 # This method sorts the URLs alphabetically
def sort_urls_alphabetically(urls)
   urls.sort_by { |url| get_name_from_url(url) }
end

# This method returns the string after the last slash (not included) in the URL
def get_name_from_url(url)
   # Extract the string after the last slash (not included) in the URL
   url.split("/").last
   # replace all non-alphanumeric characters with a space
   .gsub(/[^0-9A-Za-z]/, " ")
end

# This method returns an array of hashes containing magnet links, their corresponding size, and cumulative total size
def get_magnet_links_with_size(url, cumulative_total_size)
   options = Selenium::WebDriver::Firefox::Options.new(args: ["--headless"])
   geckodriver_path = get_geckodriver_path
   return [] if geckodriver_path.nil?

   Selenium::WebDriver::Firefox::Service.driver_path = geckodriver_path
   driver = Selenium::WebDriver.for :firefox, options: options

   driver.manage.timeouts.page_load = 300

   begin
      driver.get(url)
      sleep(20)

      html_content = driver.page_source
      doc = Nokogiri::HTML(html_content)

      magnet_links_with_size = []

      doc.css("a[href^='magnet:?']").each do |link|
      magnet_link = link["href"]

      # Use XPath to get the size directly
      size_value = doc.at_xpath("/html/body/center/div[1]/div/center/table/tbody/tr[6]/td[2]")&.text

      # If size is found, replace the weird space and add the magnet link and size to the array
      if size_value
         # Replace space with space
         size_value = size_value.gsub("\u00A0", " ")

         # Extract numerical value and unit (GB or MB)
         size, unit = size_value.split(' ')

         # Convert size to GB if in MB
         size = size.to_f / 1000 if unit == 'MB'

         cumulative_total_size += size.to_f
         total_size = "#{cumulative_total_size} GB"
         magnet_links_with_size << { "size" => "#{sprintf('%.2f', size)} GB", "total_size" => "#{sprintf('%.2f', cumulative_total_size)} GB", "magnet_link" => magnet_link }
      else
         # Else, add the magnet link with nil size to the array
         magnet_links_with_size << { "size" => "0.0 GB", "total_size" => "0.0 GB", "magnet_link" => magnet_link, }
      end
   end

      return magnet_links_with_size, cumulative_total_size
   rescue StandardError => e
      puts "An error occurred: #{e.message}"
      return [], cumulative_total_size
   ensure
      driver.quit
   end
end

# Read URLs from the text file
url_file_path = "URLs.txt"
urls = File.readlines(url_file_path, chomp: true)

unless sorted_alphabetically?(urls)
   puts "Sorting URLs alphabetically..."
   urls = sort_urls_alphabetically(urls)
   File.write(url_file_path, urls.join("\n"))
   puts "URLs sorted alphabetically"
end

# Initialize progress bar
progress_bar = ProgressBar.create(total: urls.size, format: "%t |%B| %p%% %e")

# Check if the CSV file exists or is empty
csv_exists_or_empty = !File.exist?("Magnet_URLs.csv") || File.zero?("Magnet_URLs.csv")

# Open the CSV file in append mode
CSV.open("Magnet_URLs.csv", "a") do |csv|
   # Write header only if the file is new or empty
   csv << ["Name", "Size GB", "Total Size GB", "Magnet URL", "Source URL"] if csv_exists_or_empty
end

# Initialize cumulative total size
cumulative_total_size = 0.0

# Iterate through each URL
urls.each_with_index do |url, index|
   name = get_name_from_url(url)
   magnet_links_with_size, cumulative_total_size = get_magnet_links_with_size(url, cumulative_total_size)

   # Open the CSV file in append mode
   CSV.open("Magnet_URLs.csv", "a") do |csv|
      # Write data for each magnet link with size immediately
      magnet_links_with_size.each do |magnet_data|
      csv << [name, magnet_data["size"], magnet_data["total_size"], magnet_data["magnet_link"], url]
      end
   end

   # Update progress bar and counter with the URL
   progress_bar.increment
   puts "Processing URL #{index + 1}/#{urls.size} - #{url}" if index < urls.size - 1
end

puts "Results saved to Magnet_URLs.csv"

# Play sound at the end
sound_file_path = "./.assets/Sounds/NotificationSound.wav"
if File.exist?(sound_file_path)
   if RbConfig::CONFIG["host_os"] =~ /linux/
      # Linux command to play sound
      system("aplay #{sound_file_path}")
   elsif RbConfig::CONFIG["host_os"] =~ /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      # Windows command to play sound
      system("start #{sound_file_path}")
   end
else
   puts "Sound file not found: #{sound_file_path}"
end
