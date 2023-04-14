# Using the array collecton, write a program that:
# Recieve three numbers from the user"
# And then show every number elevaded to the power of 2

numbers = []
i = 0

for i in 1..3
    puts "Enter a number:"
    numbers.push(gets.chomp.to_i)
end

numbers.each do |number|
    puts "The number #{number} elevaded to the power of 2 is #{number ** 2}"
end