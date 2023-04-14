# require './Animal.rb' # The dot means the current directory -> BAD PRACTICE
require_relative 'Animal' # The relative means the current directory
require_relative 'Dog' # The relative means the current directory
# Inverting the order of the require_relative will cause an error
 
puts("Dog: ")
dog = Dog.new
dog.jump

puts("Animal: ")
animal = Animal.new
animal.jump