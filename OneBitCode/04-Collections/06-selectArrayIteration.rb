# Program to show the usage of the select method in collections - Array

array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

selection = array.select do |element|
    element % 2 == 0 # Here you can use any condition
end

puts "original array = #{array}"
puts "selection = #{selection}"