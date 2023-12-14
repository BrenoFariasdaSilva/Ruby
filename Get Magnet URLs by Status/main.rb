require "csv" # Import the CSV gem
require "rbconfig" # Import the RbConfig gem

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

STATUS = "Downloading" # Specify the status to filter

def get_magnet_urls(csv_file_path)
   magnet_urls = [] # Initialize an empty array

   # Read CSV file
   CSV.foreach(csv_file_path, headers: true) do |row|
      status = row["Status"]
      magnet_url = row["Magnet URL"]

      # Check if the status is "Downloading"
      if status && status == STATUS && magnet_url
         magnet_urls << magnet_url # Add the Magnet URL to the array
      end
   end

   magnet_urls # Return the array of Magnet URLs
end
 
# Specify the path to your CSV file
csv_file_path = "../Magnet URLs/Magnet_URLs.csv"

# Get Magnet URLs for rows with "Status" as "Downloading"
downloading_magnet_urls = get_magnet_urls(csv_file_path)

# Save Magnet URLs to a text file
output_file_path = "../Magnet URLs/#{STATUS}-Magnet_URLs.txt"
File.open(output_file_path, "w") do |file|
downloading_magnet_urls.each do |magnet_url|
   file.puts magnet_url
end
end

puts "Downloading Magnet URLs saved to #{output_file_path}"

# Sound file path
sound_file_path = "../.assets/Sounds/NotificationSound.wav"

# Play sound at the end
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
