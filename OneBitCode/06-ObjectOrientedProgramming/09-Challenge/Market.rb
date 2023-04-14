class Market
	def initialize(name, price)
		@name = name
		@price = price
	end

	def purchase
		puts "Product #{@name} purchased for the price of #{@price}"
	end
end