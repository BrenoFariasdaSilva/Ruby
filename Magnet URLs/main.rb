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

# This function gets the String after the last slash in the URL and gets the name and status from it
def get_name_and_status_from_url(url)
   last_string = url.split("/").last # Get the String after the last slash in the URL
   if last_string.include?(" - ") # If the String contains " - ", split it into name and status
      name, status = last_string.split(" - ") # Split the String into name and status
      name = name.gsub(/[^0-9A-Za-z]/, " ") # Replace all non-alphanumeric characters with space
   else # Else, set the name to the String and status to "Pending"
      name = last_string # Set the name to the String
      status = "Pending" # Set the status to "Pending"
   end

   return name, status # Return the name and status
end
 
# This function processes the name, replacing "-" and "_" with space and capitalizing each word
def process_name(name)
   name = name.gsub("-", " ") # Replace "-" with space
   name = name.gsub("_", " ") # Replace "_" with space

   name.split.each(&:capitalize!).join(" ") # Capitalize each word and join them with space
end
 
# This method returns an array of hashes containing magnet links, files quantity, their size, and cumulative total size.
def get_magnet_links_and_additional_infos(url, cumulative_total_size)
   options = Selenium::WebDriver::Firefox::Options.new(args: ["--headless"]) # Initialize the Firefox options
   geckodriver_path = get_geckodriver_path # Get the path to geckodriver executable
   return [] if geckodriver_path.nil? # Return empty array if geckodriver path is nil

   Selenium::WebDriver::Firefox::Service.driver_path = geckodriver_path # Set the path to geckodriver executable
   driver = Selenium::WebDriver.for :firefox, options: options # Initialize the Firefox driver

   driver.manage.timeouts.page_load = 300 # Set the page load timeout to 300 seconds

   begin
      driver.get(url) # Open the URL
      sleep(20) # Wait for 20 seconds for the page to load

      html_content = driver.page_source # Get the page source
      doc = Nokogiri::HTML(html_content) # Parse the page source with Nokogiri

      magnet_links_with_size_and_files = [] # Initialize the array of hashes containing magnet links, files quantity, their size, and cumulative total size

      doc.css("a[href^='magnet:?']").each do |link| # Iterate through each magnet link
         magnet_link = link["href"] # Get the magnet link

         # Use XPath to get the size directly
         size_value = doc.at_xpath("/html/body/center/div[1]/div/center/table/tbody/tr[6]/td[2]")&.text

         # Use XPath to get the files quantity directly
         files_quantity = doc.at_xpath("/html/body/center/div[1]/div/center/table/tbody/tr[8]/td[2]")&.text

         # If size is found, replace the weird space and add the magnet link and size to the array
         if size_value
            # Replace space with space
            size_value = size_value.gsub("\u00A0", " ")

            # Extract numerical value and unit (GB or MB)
            size, unit = size_value.split(" ")

            # Convert size to GB if in MB
            size = size.to_f / 1000 if unit == "MB"

            cumulative_total_size += size.to_f
            total_size = "#{cumulative_total_size} GB"
            magnet_links_with_size_and_files << {
               "files_quantity" => files_quantity,
               "size" => "#{sprintf("%.2f", size)} GB",
               "total_size" => "#{sprintf("%.2f", cumulative_total_size)} GB",
               "magnet_link" => magnet_link
            }
         else
            # Else, add the magnet link with nil size to the array
            magnet_links_with_size_and_files << {
               "files_quantity" => files_quantity,
               "size" => "0.0 GB",
               "total_size" => "0.0 GB",
               "magnet_link" => magnet_link
            }
            end
      end

      return magnet_links_with_size_and_files, cumulative_total_size # Return the array of hashes containing magnet links, files quantity, their size, and cumulative total size
   rescue StandardError => e
      puts "An error occurred: #{e.message}"
      return [], cumulative_total_size # Return empty array and cumulative total size
   ensure
      driver.quit # Quit the driver
   end
end
 
# This method plays a sound file based on the operating system
def play_sound(sound_file_path)
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
end
 
# Main function
def main
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
      csv << ["Name", "Files", "Size GB", "Total Size GB", "Status", "Magnet URL", "Source URL"] if csv_exists_or_empty
   end

   # Initialize cumulative total size
   cumulative_total_size = 0.0

   # Iterate through each URL
   urls.each_with_index do |url, index|
      name, status = get_name_and_status_from_url(url)
      name = process_name(name) # Process the name

      informations, cumulative_total_size = get_magnet_links_and_additional_infos(url, cumulative_total_size)
      clean_url = url.split(" - ").first

      # Open the CSV file in append mode
      CSV.open("Magnet_URLs.csv", "a") do |csv|
         # Write data for each magnet link with size and files quantity immediately
         informations.each do |url_data|
         csv << [name, url_data["files_quantity"], url_data["size"], url_data["total_size"], status, url_data["magnet_link"], clean_url]
         end
      end

      # Update progress bar and counter with the URL
      progress_bar.increment
      puts "#{index + 1}/#{urls.size} - Processing #{name} (#{status}): #{clean_url}" if index < urls.size - 1
   end

   puts "Results saved to Magnet_URLs.csv"

   # Sound file path
   sound_file_path = "../.assets/Sounds/NotificationSound.wav"

   # Play sound at the end
   play_sound(sound_file_path)
end
 
# Call the main function
main