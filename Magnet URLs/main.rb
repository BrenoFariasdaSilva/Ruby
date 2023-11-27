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

# This method returns the string after the last slash (not included) in the URL
def get_name_from_url(url)
   # Extract the string after the last slash (not included) in the URL
   url.split("/").last
end

# This method returns an array of hashes containing magnet links and their corresponding size
def get_magnet_links_with_size(url)
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

         # Find the preceding <td> with the text "Size:"
         size_td = link.at_xpath("preceding::td[contains(text(), 'Size:')]")

         # If a <td> with "Size:" is found, get the size from the following <td>
         if size_td
            size_value_td = size_td.at_xpath("following-sibling::td")
            size_value = size_value_td&.text

            # Add the magnet link and size to the array
            magnet_links_with_size << { "magnet_link" => magnet_link, "size" => size_value }
         # Else, add the magnet link with nil size to the array
         else
            magnet_links_with_size << { "magnet_link" => magnet_link, "size" => 0.0 }
         end
      end

      return magnet_links_with_size

   rescue StandardError => e
      puts "An error occurred: #{e.message}"
      return []

   ensure
      driver.quit
   end
end

# Read URLs from the text file
url_file_path = "URLs.txt"
urls = File.readlines(url_file_path, chomp: true)

# Initialize progress bar
progress_bar = ProgressBar.create(total: urls.size, format: "%t |%B| %p%% %e")

# Check if the CSV file exists or is empty
csv_exists_or_empty = !File.exist?("Magnet_URLs.csv") || File.zero?("Magnet_URLs.csv")

# Open the CSV file in append mode
CSV.open("Magnet_URLs.csv", "a") do |csv|
   # Write header only if the file is new or empty
   csv << ["Name", "Magnet URL", "Size", "Source URL"] if csv_exists_or_empty
end

# Iterate through each URL
urls.each_with_index do |url, index|
   name = get_name_from_url(url)
   magnet_links_with_size = get_magnet_links_with_size(url)

   # Open the CSV file in append mode
   CSV.open("Magnet_URLs.csv", "a") do |csv|
      # Write data for each magnet link with size immediately
      magnet_links_with_size.each do |magnet_data|
         csv << [name, magnet_data["magnet_link"], magnet_data["size"], url]
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
