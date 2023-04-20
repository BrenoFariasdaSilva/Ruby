# Program to show the usage of both conditional and iteration structures
 
# get the current year
current_year = Time.now.year

result = ""

loop do 
	# get the year
	print "Enter the year you were born: "
	year = gets.chomp.to_i

	# check if the year is valid
	if year < 0
		puts "The year must be greater than 0."
		next
	end

	# calculate the age
	age = current_year - year

	# check if the age is valid
	if age < 0
		puts "You haven't been born yet."
		next
	# check if the age is valid
	elsif age > 150
		puts "You are too old."
		next
	# check if the age is valid
	else 
		result = "You are #{age} years old."
	end

	# show the result
	puts result

	# ask if the user wants to continue
	print "Do you want to continue? (y/n): "
	continue = gets.chomp.downcase

	# check if the user wants to continue
	break if continue != "y"
end