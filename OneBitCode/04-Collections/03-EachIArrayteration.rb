# Program to show the usage of the each method in collections - Array

names = ["Manoel", "Marcia", "Amanda", "Batistela", "Pamella", "Thaynara"]

name = "Breno Farias"

# The each method iterates over the elements of the collection without modifying the variable beetwen pipes
names.each do |name| 
	puts("Hello #{name}")
end

puts("name = #{name}")