class User
	@@user_count = 0
	def add(name)
		puts "User #{name} added"
		@@user_count += 1
		puts "Total users: #{@@user_count}"
	end
end

first_user = User.new
first_user.add('Breno')

second_user = User.new
second_user.add('Amanda')

third_user = User.new
third_user.add('Manoel')