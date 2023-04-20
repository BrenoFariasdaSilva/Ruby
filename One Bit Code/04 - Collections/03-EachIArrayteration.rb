# Program to show the usage of the each method in collections - Array

# Each vs Map vs Select
# Each: Iterates over the elements of the collection without modifying the variable beetwen pipes
# Map: Iterates over the elements of the collection and returns a new collection with the results of the block
# Select: Iterates over the elements of the collection and returns a new collection with the elements that match the condition of the block

names = ["Manoel", "Marcia", "Amanda", "Batistela", "Pamella", "Thaynara"]

name = "Breno Farias"

# The each method iterates over the elements of the collection without modifying the variable beetwen pipes
names.each do |name| 
	puts("Hello #{name}")
end

puts("name = #{name}")