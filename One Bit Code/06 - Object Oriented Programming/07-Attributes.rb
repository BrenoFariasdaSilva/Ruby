# class Dog
# 	def name
# 		@name
# 	end

# 	def name= name
# 		@name = name
# 	end
# end

# Bad practice, its better to use attr_accessor

class Dog
	attr_accessor :name, :age
end

dog = Dog.new
dog.name = 'Luke'
dog.age = 2
puts dog.name
puts dog.age