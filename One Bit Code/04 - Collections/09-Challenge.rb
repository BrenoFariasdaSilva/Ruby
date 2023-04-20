# Create a hash collection and let the user add three elements to it
# informing the key and the value
# Then show the collection

hash_collection = Hash.new

for i in 1..3
    puts "Enter a key:"
    key = gets.chomp
    puts "Enter a value:"
    value = gets.chomp
    hash_collection[key] = value
end

hash_collection.each do |key, value|
    puts "The key #{key} has the value #{value}"
end