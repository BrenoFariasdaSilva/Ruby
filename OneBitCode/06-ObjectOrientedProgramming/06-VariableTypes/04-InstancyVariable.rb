# Instancy Variable or Attribute are always private
# And can only be accessed or modified by methods inside the class

class User
	@user_count = 0
	def add(name)
		puts "User #{name} added"
		hello
	end
	def hello
		puts "Hello"
	end
end

first_user = User.new
first_user.add('Breno')

second_user = User.new
second_user.add('Amanda')

third_user = User.new
third_user.add('Manoel')