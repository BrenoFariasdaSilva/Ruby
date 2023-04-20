require_relative 'Market'
require_relative 'Product'

product = Product.new
product.name = "TV"
product.price = 1000

Market.new(product.name, product.price).purchase