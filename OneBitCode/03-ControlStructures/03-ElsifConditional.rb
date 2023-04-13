# Program to show the usage of the elsif

day = "Sunday"
lunch = "Normal"

# Usage of the elsif
if day != "Sunday" and day != "Saturday"
	puts "Happy Weekday"
elsif day == "Birthday"
	puts "Happy Birthday"
	lunch = "Super Special"
else 
	puts "Happy Weekend"
	lunch = "Special"
end

puts ("Today's lunch is #{lunch}")