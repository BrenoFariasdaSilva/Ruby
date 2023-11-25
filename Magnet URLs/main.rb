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

# This method returns an array of magnet links from the URL
def get_magnet_links(url)
   # Set up Selenium with a headless browser and dynamically get the path to the Firefox executable
   options = Selenium::WebDriver::Firefox::Options.new(args: ["--headless"])
   geckodriver_path = get_geckodriver_path
   return if geckodriver_path.nil?

   # Set the path to the geckodriver executable
   Selenium::WebDriver::Firefox::Service.driver_path = geckodriver_path
   driver = Selenium::WebDriver.for :firefox, options: options

   # Get the page source
   begin
      driver.get(url) # Load the URL

      sleep(5) # Wait for a few seconds to allow dynamic content to load

      # Get the page source after it has loaded
      html_content = driver.page_source

      # Parse the HTML content with Nokogiri
      doc = Nokogiri::HTML(html_content)

      # Extract magnet links using Nokogiri selectors
      magnet_links = doc.css("a[href^='magnet:?']").map { |link| link["href"] }

      return magnet_links # Return the magnet links

   rescue StandardError => e # Catch any errors
      puts "An error occurred: #{e.message}" 
      return []

   ensure # Ensure that the browser is closed
      # Close the browser
      driver.quit
   end
end

# Read URLs from the text file
url_file_path = "URLs.txt"
urls = File.readlines(url_file_path, chomp: true)

# Initialize progress bar
progress_bar = ProgressBar.create(total: urls.size, format: "%t |%B| %p%% %e")

# Store results in an array
results = []

# Iterate through each URL
urls.each_with_index do |url, index|
   name = get_name_from_url(url)
   magnet_links = get_magnet_links(url)
   results << { "Name" => name, "URL" => url, "Magnet URL" => magnet_links.join(", ") }

   # Update progress bar and counter with the URL
   progress_bar.increment
   puts "Processing URL #{index + 1}/#{urls.size} - #{url}" if index < urls.size - 1
end

# Save results to a CSV file
CSV.open("Magnet_URLs.csv", "w") do |csv|
   # Write header
   csv << ["Name", "Magnet URL", "Source URL"]

   # Write data
   results.each do |result|
      csv << [result["Name"], result["Magnet URL"], result["URL"]]
   end
end

puts "Results saved to Magnet_URLs.csv"
