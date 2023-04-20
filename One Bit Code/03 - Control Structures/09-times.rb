# Program to show the usage of the times structure which is similar to the for structure in other languages

fruits = ["Apple", "Orange", "Banana", "Grapes", "Pineapple", "Mango"]
count = 0

fruits.length.times do # The times structure is used to iterate a number of times
	fruit = fruits[count]
	count += 1
	puts ("#{count} - #{fruit}")
end