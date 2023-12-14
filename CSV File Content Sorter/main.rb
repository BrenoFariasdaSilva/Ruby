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

# This method sorts the CSV file content alphabetically by the specified column
def sort_csv_alphabetically(csv_file_path, sorting_column)
   csv_data = CSV.read(csv_file_path, headers: true)

   # Convert the CSV::Table to an array of hashes and sort
   csv_array = csv_data.sort_by { |row| row[sorting_column] }

   # Write the sorted array back to the CSV file
   CSV.open(csv_file_path, "w", headers: csv_data.headers, write_headers: true) do |csv|
      csv_array.each { |row| csv << row }
   end

   puts "CSV File Content Sorted Alphabetically by the #{sorting_column} Column"
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
   # Specify the path to the CSV file
   csv_file_path = "../Magnet URLs/Magnet_URLs.csv"

   # Sort the CSV file alphabetically by the specified column
   sort_csv_alphabetically(csv_file_path, SORTING_COLUMN)

   # Sound file path
   sound_file_path = "../.assets/Sounds/NotificationSound.wav"

   # Play sound at the end
   play_sound(sound_file_path)
end

# Call the main function
main