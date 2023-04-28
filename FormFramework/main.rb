require_relative "FormBuilder"

print("Enter the type of the input: ")
type = gets.chomp
print("Enter the name of the input: ")
name = gets.chomp
print("Enter the label of the input: ")
label = gets.chomp
print("Enter the options of the input: ")
options = gets.chomp

@form_fields = [
	{
		type: type,
		name: name,
		label: label,
		options: options
	}
]

@form_data = {}

html_string = FormBuilder.new(@form_fields, @form_data).build_form
puts html_string