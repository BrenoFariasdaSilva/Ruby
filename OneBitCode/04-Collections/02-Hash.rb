# Program to show the usage of collections - Hash

# What is a collection?
# A collection is a group of similar elements that can be accessed by an index or a key

brazilian_capitals = Hash.new # Create a new collection
brazilian_capitals = {} # The same as the previous line

brazilian_capitals = { "Paraná" => "Curitiba", "Tocantins" => "Palmas", "Distrito Federal" => "Brasília" } # Create a new collection
brazilian_capitals["Minas Gerais"] = "Belo Horizonte" # Add a new element to the collection

puts ("brazilian_capitals = #{brazilian_capitals}")
puts ("brazilian_capitals.keys = #{brazilian_capitals.keys}")
puts ("brazilian_capitals.values = #{brazilian_capitals.values}")

# The elements can be accessed by their key
puts("brazilian_capitals['Paraná'] = #{brazilian_capitals['Paraná']}")

# Delete an element from the collection
brazilian_capitals.delete("Paraná")
puts("brazilian_capitals = #{brazilian_capitals}")

# Pick specific elements from the collection
puts("brazilian_capitals[:Tocantins] = #{brazilian_capitals[:Tocantins]}")

# Size of the collection
puts("brazilian_capitals.size = #{brazilian_capitals.size}")

# Check if the collection is empty
puts("brazilian_capitals.empty? = #{brazilian_capitals.empty?}")
