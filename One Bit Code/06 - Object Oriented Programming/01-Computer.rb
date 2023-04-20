# The definition of the class Computer
class Computer
	def turn_on
		'turn on the computer'
	end

	def shutdown
		'shutdown the computer'
	end
end

computer = Computer.new # Creating a new instance of the class Computer
puts computer
puts computer.turn_on # Calling the method turn_on