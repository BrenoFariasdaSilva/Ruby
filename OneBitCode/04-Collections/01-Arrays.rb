# Program to show the usage of collections - Array

# What is a collection?
# A collection is a group of similar elements that can be accessed by an index or a key

brazilian_states = []

brazilian_states.push("Paraná")
brazilian_states.push("Tocantins")
brazilian_states.push("Distrito Federal")

# Multiple elements can be added at once
brazilian_states.push("Santa Catarina", "São Paulo", "Rio de Janeiro", "Minas Gerais", "Espírito Santo")
brazilian_states.push(0, "Acre", "Amapá")
brazilian_states.push(2, "Ceara")

# The elements can be accessed by their index
puts("brazilian_states[0] = #{brazilian_states[0]}")

# Multiple elements can be accessed at once
puts("brazilian_states[1..2] = #{brazilian_states[1..2]}")

# The elements can be accessed from the end of the collection by using negative indexes
puts("brazilian_states[-1] = #{brazilian_states[-1]}")

puts("brazilian_states.first = #{brazilian_states.first}")
puts("brazilian_states.last = #{brazilian_states.last}")
puts("brazilian_states.count = #{brazilian_states.count}") 

empty_array = []

puts("empty_array.empty? = #{empty_array.empty?}")
puts("empty_array = #{empty_array}")

# Query the collection for an element
puts("brazilian_states.include?('Paraná') = #{brazilian_states.include?('Paraná')}")

# Remove an element from the collection
brazilian_states.delete("Paraná")
puts("brazilian_states = #{brazilian_states}")
brazilian_states.delete_at(0)
puts("brazilian_states = #{brazilian_states}")

# Delete the first element from the collection
brazilian_states.shift
puts("brazilian_states = #{brazilian_states}")
# Delete the last element from the collection
brazilian_states.pop
puts("brazilian_states = #{brazilian_states}")