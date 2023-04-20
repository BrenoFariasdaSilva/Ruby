# Create a method that resolves the power of a number and its exponent
# Those two values should be passed as parameters and inserted by the user

def power(base, exponent)
	 base ** exponent
end

puts "Enter the base number"
base = gets.chomp.to_i

puts "Enter the exponent"
exponent = gets.chomp.to_i

puts "The result of #{base} to the power of #{exponent} is #{power(base, exponent)}"