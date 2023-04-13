# Program to show the usage of the unless

product_status = "closed"

# Usage of the unless
unless product_status == "open" # Equals to: if product_status != "open"
	check_change = "can"
else
	check_change = "can't"
end
puts ("You #{check_change} change the product")

# Alternative ways to write the unless
if product_status != "open"
	check_change = "can"
else
	check_change = "can't"
end
puts ("You #{check_change} change the product")

# Alternative way to write the unless
if not product_status == "open"
	check_change = "can"
else
	check_change = "can't"
end

puts ("You #{check_change} change the product")