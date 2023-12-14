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

# This method returns true if the URLs are sorted alphabetically, otherwise false
def sorted_alphabetically?(urls)
   names = urls.map { |url| get_name_from_url(url) }
   names == names.sort
end

 # This method sorts the URLs alphabetically
def sort_urls_alphabetically(urls)
   urls.sort_by { |url| get_name_from_url(url) }
end

# This method returns the string after the last slash (not included) in the URL
def get_name_from_url(url)
   # Extract the string after the last slash (not included) in the URL
   url.split("/").last
   # replace all non-alphanumeric characters with a space
   .gsub(/[^0-9A-Za-z]/, " ")
end

# Read URLs from the text file
url_file_path = "../Magnet URLs/URLs.txt"
urls = File.readlines(url_file_path, chomp: true)

unless sorted_alphabetically?(urls)
   puts "Sorting Text File Content Alphabetically..."
   urls = sort_urls_alphabetically(urls)
   File.write(url_file_path, urls.join("\n"))
end

puts "Text File Content Sorted Alphabetically"

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
