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

# This method returns an array of the occurrences from the VALUES_COLUMN when the SEARCHED_OCCURRENCE is found in the SEARCH_COLUMN
def get_occurrences(input_csv_filepath, search_column, searched_occurrence, values_column)
   occurrences = [] # Initialize an empty array to store the occurrences

   # Read CSV file
   CSV.foreach(input_csv_filepath, headers: true) do |row|
      search_column_value = row[search_column] # Get the value of the SEARCH_COLUMN
      current_occurrence = row[values_column] # Get the value of the VALUES_COLUMN

      # Verify if the search_column_value is equal to the searched_occurrence
      if search_column_value && search_column_value == searched_occurrence && current_occurrence
         occurrences << current_occurrence # Add the current_occurrence to the array
      end
   end

   occurrences # Return the array of the found occurrences
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
   search_column = "Status" # Specify the column to match the searched_occurrence value
   searched_occurrence = "Downloading" # Specify the value to match in the search_column
   values_column = "Magnet URL" # Specify the column to get values from when the searched_occurrence is found in the search_column
   input_csv_filepath = "../Magnet URLs/Magnet_URLs.csv"

   # Get the occurrences from the values_column when the searched_occurrence is found in the search_column
   occurrences = get_occurrences(input_csv_filepath, search_column, searched_occurrence, values_column)

   # Save the found occurrences to a text file
   output_file_path = "../Magnet URLs/#{search_column}-#{searched_occurrence}.txt"
   File.open(output_file_path, "w") do |file|
      occurrences.each do |magnet_url|
         file.puts magnet_url
      end
   end

   puts "Saving the values from the column '#{values_column}' to the file '#{output_file_path}' when the value '#{searched_occurrence}' is found in the '#{search_column}' column"

   # Sound file path
   sound_file_path = "../.assets/Sounds/NotificationSound.wav"

   # Play sound at the end
   play_sound(sound_file_path)
end
 
# Call the main function
main