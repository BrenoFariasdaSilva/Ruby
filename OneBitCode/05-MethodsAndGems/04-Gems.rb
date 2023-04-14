# The definition of a Gem is like libraries
# A Gem is a package of Ruby code that can be used in other Ruby programs

# Run: sudo gem install os

require 'os'

def my_os
  if OS.windows?
    "Windows"
  elsif OS.linux?
    "Linux"
  elsif OS.mac?
    "Mac"
  else
    "Unknown"
  end
end

puts "My OS is #{my_os}, {OS.bits} bits, with #{OS.cpu_count} cores"

# How to uninstall a gem?
# Run: gem uninstall os

# How to list all gems?
# Run: gem list