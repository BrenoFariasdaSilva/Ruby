# Program to show the usage of the select method in collections - Hash

array = {1 => "Manoel", 2 => "Marcia", 3 => "Amanda", 4 => "Batistela", 5 => "Pamella", 6 => "Thaynara"}

selection = array.select do |key, value|
    key % 2 == 0 # Here you can use any condition
end

puts "original array = #{array}"
puts "selection = #{selection}"