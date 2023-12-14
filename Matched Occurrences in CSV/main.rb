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

# Constants:
SEARCH_COLUMN = "Status" # Specify the column to match the SEARCHED_OCCURRENCE value
SEARCHED_OCCURRENCE = "Downloading" # Specify the value to match in the SEARCH_COLUMN
VALUES_COLUMN = "Magnet URL" # Specify the column to get values from when the SEARCHED_OCCURRENCE is found in the SEARCH_COLUMN
INPUT_CSV_FILEPATH = "../Magnet URLs/Magnet_URLs.csv"

# This method returns an array of the occurrences from the VALUES_COLUMN when the SEARCHED_OCCURRENCE is found in the SEARCH_COLUMN
def get_occurrences(INPUT_CSV_FILEPATH)
   occurrences = [] # Initialize an empty array to store the occurrences

   # Read CSV file
   CSV.foreach(INPUT_CSV_FILEPATH, headers: true) do |row|
      search_column = row[SEARCH_COLUMN] # Get the value of the SEARCH_COLUMN
      occurrence = row[VALUES_COLUMN] # Get the value of the VALUES_COLUMN

      # Verify if the SEARCHED_OCCURRENCE is found in the SEARCH_COLUMN
      if search_column && occurrence && search_column == occurrence
         occurrences << occurrence # Add the occurrence to the array
      end
   end

   occurrences # Return the array of the found occurrences
end
 
# Get the occurrences from the VALUES_COLUMN when the SEARCHED_OCCURRENCE is found in the SEARCH_COLUMN
occurrences = get_occurrences(INPUT_CSV_FILEPATH)

# Save the found occurrences to a text file
output_file_path = "../Magnet URLs/#{SEARCH_COLUMN}:#{SEARCHED_OCCURRENCE}.txt"
File.open(output_file_path, "w") do |file|
   occurrences.each do |magnet_url|
      file.puts magnet_url
   end
end

puts "Saving the values from the column '#{VALUES_COLUMN}' to the file '#{output_file_path}' when the value '#{SEARCHED_OCCURRENCE}' is found in the column '#{SEARCH_COLUMN}'"

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
