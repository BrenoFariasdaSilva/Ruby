class Person
	def initialize(name, age)
	@name = name
	@age = age
  end

  def check
	puts "Created instancy of class Person with the following attributes:"
	puts "Name: #{@name}"
	puts "Age: #{@age}"
  end
end

person = Person.new("Breno", 22)
puts person.check