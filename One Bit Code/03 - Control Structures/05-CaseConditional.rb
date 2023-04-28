# Program to show the usage of the case conditional

puts ("Type the number of month of your birthday: ")
month = gets.chomp.to_i

case month
	when 1
		puts ("You were born in January")
	when 2
		puts ("You were born in February")
	when 3
		puts ("You were born in March")
	when 4
		puts ("You were born in April")
	when 5
		puts ("You were born in May")
	when 6
		puts ("You were born in June")
	when 7
		puts ("You were born in July")
	when 8
		puts ("You were born in August")
	when 9
		puts ("You were born in September")
	when 10
		puts ("You were born in October")
	when 11
		puts ("You were born in November")
	when 12
		puts ("You were born in December")
	else
		puts ("Invalid month")
end

# Better way to do this using array
month_names = ["JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"]
puts ("You were born in #{month_names[month - 1]}")

# Alternative way to do this using hash
hash_month_names = {
	1 => "JANUARY", 2 => "FEBRUARY", 3 => "MARCH", 4 => "APRIL", 5 => "MAY", 6 => "JUNE",
 	7 => "JULY", 8 => "AUGUST", 9 => "SEPTEMBER", 10 => "OCTOBER", 11 => "NOVEMBER", 12 => "DECEMBER"
}
puts ("You were born in #{hash_month_names[month]}")