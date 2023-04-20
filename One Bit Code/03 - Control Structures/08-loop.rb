# Program to show the usage of the loop structure which is similar to the while structure in other languages

fruits = ["Apple", "Orange", "Banana", "Grapes", "Pineapple", "Mango"]
count = 0

loop do
	break if count == fruits.length
	fruit = fruits[count]
	count += 1
	puts ("#{count} - #{fruit}")
end