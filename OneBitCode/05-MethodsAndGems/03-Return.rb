def compare (first_value, second_value)
  first_value > second_value
  # The last value is returned if the return keyword is not explicitly used
end

def new_compare (first_value, second_value)
  if first_value > second_value
    return true
  else
    return false
  end
end

first_value = 30
second_value = 20

puts compare(first_value, second_value)
puts new_compare(first_value, second_value)