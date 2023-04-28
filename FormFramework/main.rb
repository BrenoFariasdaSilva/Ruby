require_relative "FormBuilder"

# print("Enter the type of the input: ")
# type = gets.chomp
# print("Enter the name of the input: ")
# name = gets.chomp
# print("Enter the label of the input: ")
# label = gets.chomp
# print("Enter the options of the input: ")
# options = gets.chomp



# @form_fields = [
	# 	{
		# 		type: type,
		# 		name: name,
		# 		label: label,
		# 		options: options
		# 	}
		# ]
		
		@form_data = {}
		
		# create a new instance of the FormBuilder class
types_of_inputs = ["text", "textarea", "select", "radio", "checkbox", "button"]
form = FormBuilder.new()

html_form = ""

# call the build_form method on the form instance
for type in types_of_inputs
	html_form = html_form + form.build_form(type, "name", "label", ["option1", "option2"])
end

# print the HTML string to the terminal
puts html_form

# now write this HTML string to a file named form.html
File.write("form.html", html_form)

