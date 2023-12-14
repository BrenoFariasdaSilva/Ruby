require "csv"
require "rbconfig" # Import the RbConfig gem

# Constant for sorting column
SORTING_COLUMN = "Name"

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

# Read CSV file
csv_file_path = "../Magnet URLs/Magnet_URLs.csv"
csv_data = CSV.read(csv_file_path, headers: true)

# Convert the CSV::Table to an array of hashes and sort
csv_array = csv_data.sort_by { |row| row[SORTING_COLUMN] }

# Write the sorted array back to the CSV file
CSV.open(csv_file_path, "w", headers: csv_data.headers, write_headers: true) do |csv|
   csv_array.each { |row| csv << row }
end

puts "CSV File Content Sorted Alphabetically by the #{SORTING_COLUMN} Column"

# Sound file path
sound_file_path = "./.assets/Sounds/NotificationSound.wav"

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
