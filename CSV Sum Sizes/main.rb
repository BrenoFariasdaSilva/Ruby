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

# This method updates the "Total Size GB" column in the CSV file
def update_total_size(csv_file_path)
   csv_data = CSV.read(csv_file_path, headers: true) # Read the CSV file
   headers = csv_data.headers # Get the headers of the CSV file
   cumulative_total_size = 0.0 # Initialize the cumulative total size

   csv_data.each do |row| # Iterate through each row of the CSV file
      size_gb = row["Size GB"].to_f # Get the size in GB and convert it to float
      row["Total Size GB"] = (cumulative_total_size += size_gb).round(2).to_s # Update the "Total Size GB" column

      if row["Total Size GB"] != row["Total Size GB"].to_f.round(2).to_s # Check if the "Total Size GB" column is updated
         puts "Updating Total Size for '#{row["Name"]}'" # Print the name of the torrent
      end
   end

   # Write the updated CSV data to the CSV file
   CSV.open(csv_file_path, "w", headers: headers, write_headers: true) do |csv|
      csv_data.each { |row| csv << row } # Iterate through each row of the CSV data
   end

   puts "CSV file updated successfully."
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

   # Update the "Total Size GB" column in the CSV file
   update_total_size(csv_file_path)

   # Sound file path
   sound_file_path = "../.assets/Sounds/NotificationSound.wav"

   # Play sound at the end
   play_sound(sound_file_path)
end

# Call the main function
main