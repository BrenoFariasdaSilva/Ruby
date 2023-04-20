# Given the following hash:
# numbers = {a: 10, b: 30, c: 20, d: 25, e: 15}
# Write a program that:
# 1. Show the highest value of the hash

numbers_collection = {a: 10, b: 30, c: 20, d: 25, e: 15}
selection = numbers_collection.select do |key, value|
    value == numbers_collection.values.max
end

puts "The highest value of the hash is #{selection}"