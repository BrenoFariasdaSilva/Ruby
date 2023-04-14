# The definition of the class Computer
class Animal
	def jump
		'jumping...'
	end

	def sleep
		'sleeping...'
	end
end

class Dog < Animal
   def bark
	  'barking...'
	end
end

class Cat < Animal
   def meow
	  'meowing...'
	end
end

dog = Dog.new
puts ("Dog: " + dog.bark)
puts ("Dog: " + dog.jump)
puts ("Dog: " + dog.sleep)

cat = Cat.new
puts ("Cat: " + cat.meow)