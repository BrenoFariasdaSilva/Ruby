# Example of how to use Polymorphism in Ruby

class Instrument
	def write
		puts "Writting"
	end
end

class Keyboard < Instrument
end

class Pencil < Instrument
	def write
		super.write # Calling the method write from the superclass which is Instrument
	end
end

class Pen < Instrument
	def write
		puts "Writting with a pen"
	end
end

keyboard = Keyboard.new
pencil = Pencil.new
pen = Pen.new

puts "Keyboard"
puts keyboard.write

puts "Pencil"
puts pencil.write

puts "Pen"
puts pen.write