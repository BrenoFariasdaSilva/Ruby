# There are no "primitive types" in Ruby; all types are classes
# Ruby is a dynamically typed language, which means that the type of a variable is determined at runtime

# Integer
integerVariable = 10
puts("integerVariable.class: ", integerVariable.class) # Print the type of the variable 

integerVariable = 10.01
# Now integerVariable is a float!
puts("integerVariable.class: ", integerVariable.class) # Print the type of the variable

bytecode_array = [0x01, 0x02, 0x03, 0x04, 0x05]
puts("bytecode_array.class:", bytecode_array.class) # Print the type of the variable
# Array

for i in bytecode_array
	puts("bytecode_array[{i}]: ", i)
end

# String
stringVariable = "random string"

puts("stringVariable.class: ", stringVariable.class) # Print the type of the variable
puts("stringVariable.object_id: ", stringVariable.object_id) # Print the object id of the variable

# Symbol
firstSymbol = :firstSymbol
secondSymbol = :firstSymbol

puts("firstSymbol.object_id: ", firstSymbol.object_id) # Print the object id of the variable
puts("secondSymbol.object_id: ", secondSymbol.object_id) # Print the object id of the variable
# Why are they in the same memory address? Because they are the same symbol!
# If the symbol is the same, the object id will be the same

# Hash
testHash = { course: "Ruby", language: "pt-br", location: "OneBitCode.com" }
puts("testHash[:course]: ", testHash[:course]) # Print the value of the key :course
