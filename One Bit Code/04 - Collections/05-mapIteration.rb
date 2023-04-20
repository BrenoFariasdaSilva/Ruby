# Program to show the usage of the map method in collections

array = [1, 2, 3, 4, 5]

puts "Usage of map method in collections - Array"

new_array = array.map do |element|
    element * 2
end

puts "original array = #{array}"
puts "new array = #{new_array}"

# Map with ! (bang) operator which modifies the original array
puts "Usage of map! method in collections - Array"

new_array = array.map! { 
   |element| element * 2
}

puts "original array = #{array}"
puts "new array = #{new_array}"
