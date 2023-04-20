# Program to show the usage of the else condition

day = "Sunday"
lunch = "Normal"

# Usage of if and else
if day == "Sunday" or day == "Saturday"
	puts "Happy Weekend"
	lunch = "Special"
else 
	puts "Happy Weekday"
end

puts ("Today's lunch is #{lunch}")