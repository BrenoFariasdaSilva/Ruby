require "csv"
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

# Read CSV file
csv_file_path = "../Magnet URLs/Magnet_URLs.csv"
csv_data = CSV.read(csv_file_path, headers: true)

# Get headers from the CSV file
headers = csv_data.headers

# Initialize cumulative total size
cumulative_total_size = 0.0

# Iterate through each row
csv_data.each do |row|
   # Extract size from the "Size GB" column
   size_gb = row["Size GB"].to_f

   # Update "Total Size GB" column based on the cumulative total size
   row["Total Size GB"] = (cumulative_total_size += size_gb).round(2).to_s

   # Check if the calculated "Total Size GB" matches the existing value
   if row["Total Size GB"] != row["Total Size GB"].to_f.round(2).to_s
      puts "Updating Total Size for '#{row["Name"]}'"
   end
end

# Write the updated data back to the CSV file
CSV.open(csv_file_path, "w", headers: headers, write_headers: true) do |csv|
  csv_data.each { |row| csv << row }
end

puts "CSV file updated successfully."

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
