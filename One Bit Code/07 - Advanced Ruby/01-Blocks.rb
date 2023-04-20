# Blocks are anonymous functions that can be passed to methods as arguments
# Blocks are defined with the do/end keywords or with curly braces

5.times { puts 'Executing the block' }

# Or with array

sum = 0
numbers = [5, 10, 5]
numbers.each { |number| sum += number } # The block is executed for each element in the array is a Block
puts sum

# Or with hash

foo = { 2 => 3, 4 => 5 }
foo.each do |key, value|
	puts "Key = #{key}"
	puts "Value = #{value}"
	puts "Key * Value = #{key * value}"
	puts '-----------------'
end

# Or with a method

def random
	if block_given?
		# Call the block
		yield
	else
		puts 'No block given'
	end
end

random { puts 'Executed the block' }
random

# Another example using &block

def newRandom(name, &block)
	puts "Name = #{name}"
	# Call the block
	block.call
end

newRandom('Breno') { puts 'Executed the block' }

# 

def anotherRandom(numbers, &block)
	if block_given?
		numbers.each do |key, value|
			block.call(key, value)
		end
	end
end

numbers = { 2 => 2, 3 => 3, 4 => 4 }

anotherRandom(numbers) do |key, value|
	puts "Key + Value = #{key + value}"
	puts "Key * Value = #{key * value}"
	puts '-----------------'
end