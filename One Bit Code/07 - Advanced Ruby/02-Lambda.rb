first_lambda = lambda { puts "Hello" }
# Stores the lambda in the first_lambda variable
first_lambda.call

# Or you could use the -> notation
second_lambda = -> (names) { names.each { |name| puts name } }
# (names) is the parameter and { names.each { |name| puts name } } is the body

names = ['Breno', 'Amanda', 'Manoel']

second_lambda.call(names)

# Multiple lines Lambda

my_lambda = lambda do |numbers|
	index = 0
	puts 'Número atual + Próximo número'
	numbers.each do |number|
		return if numbers[index] == numbers.last
		puts "(#{numbers[index]}) + (#{numbers[index + 1]})"
		puts numbers[index] + numbers[index + 1]
		index += 1
	end
end

numbers = [1, 2, 3, 4]
my_lambda.call(numbers)

# Another example

def foo(third_lambda, forth_lambda)
	third_lambda.call
	forth_lambda.call
end

third_lambda = lambda { puts 'First lambda' }
forth_lambda = lambda { puts 'Second lambda' }

foo(third_lambda, forth_lambda)