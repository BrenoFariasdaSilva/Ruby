require_relative "FormBuilder"

types_of_inputs = ["text", "textArea", "select", "radio", "checkbox", "button"]
form_builder = FormBuilder.new()
html_form = ""
html_form = form_builder.initialize_form(html_form)

# call the build_form method on the form_builder instance
for type in types_of_inputs
	html_form = form_builder.add_field(html_form, type, type, type, [type + "1", type + "2", type + "3"])
end

html_form = form_builder.submit_form_button(html_form)

# now write this HTML string to a file named form_builder.html
File.write("form.html", html_form)