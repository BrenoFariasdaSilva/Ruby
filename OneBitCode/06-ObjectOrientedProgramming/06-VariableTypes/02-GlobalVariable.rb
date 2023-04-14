class Bar
	def createGlobal
		$globalVariable = 0
		puts "Global variable inside the class Bar: #{$globalVariable}"
	end
end

class OtherBar
	def increment
		$globalVariable += 1
		puts "Global variable inside the class OtherBar: #{$globalVariable}"
	end
end

bar = Bar.new
newBar = OtherBar.new

bar.createGlobal
newBar.increment
puts "Global variable outside the classes: #{$globalVariable}"

$globalVariable = 10
puts "Global variable outside the classes: #{$globalVariable}"