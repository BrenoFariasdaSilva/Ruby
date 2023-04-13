# Challenge is to create a calculator that can add, subtract, multiply, and divide with a log of all the operations performed.

user_input = ""

loop do
	puts "Enter the first number: "
	first_number = gets.chomp.to_i
	puts "Enter the second number: "
	second_number = gets.chomp.to_i
	puts "Enter the operation (+, -, *, /): "
	operation = gets.chomp
	result = 0
	case operation
	when "+"
		result = first_number + second_number
	when "-"
		result = first_number - second_number
	when "*"
		result = first_number * second_number
	when "/"
		result = first_number / second_number
	else
		puts "Invalid operation"
	end
	puts "The result is #{result}"
	puts "Do you want to continue? (y/n)"
	user_input = gets.chomp.downcase
	break if user_input != "y"
end