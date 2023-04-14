module ReserveWorld
	def self.puts text
		print text.reverse.to_s
	end
end

module NormalWorld
	def self.puts text
		print text
	end
end

ReserveWorld.puts "\nHello World"
NormalWorld.puts "\nHello World"