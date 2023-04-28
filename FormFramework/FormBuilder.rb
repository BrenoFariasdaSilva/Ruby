class FormBuilder
   # Constructor initializes the instance html_form variable
   # def initialize()
   #    @html_form =
   #    "<!DOCTYPE html>
   #    <html>
   #      <head>
   #        <title>HTML Form</title>
   #      </head>
   #      <body> "

   # Method for adding a form field to the form_fields array
   # def add_field(type, name, label, options = {})
      # Create a new hash to hold the field's information
      # field = {type: type, name: name, label: label, options: options}
      # Add the field hash to the form_fields array
      # @form_fields << field
   # end

   def initialize_form(html_form)
      html_form = ""
      html_form = "<!DOCTYPE html>
      <html>
        <head>
          <title>HTML Form</title>
        </head>
        <body> "
      return html_form
   end

   # Method for building the HTML form
   def add_field(html_form, type, name, label, options = {})
      case type
         when "text"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # Add the text input with the name and id attributes
            html_form = html_form + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\"> "
            html_form = html_form + "<br><br>"
         when "textArea"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # Add the text input with the name and id attributes
            html_form = html_form + "<textarea name=\"#{name}\" id=\"#{name}\"></textarea> "
            html_form = html_form + "<br><br>"
         when "select"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # Add the text input with the name and id attributes
            html_form = html_form + "<select name=\"#{name}\" id=\"#{name}\"> "
            # Add the text input with the name and id attributes
            options.each do |option|
               html_form = html_form + "<option value=\"#{option}\">#{option}</option> "
            end
            html_form = html_form + "</select> "
            html_form = html_form + "<br><br>"
         when "radio"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # html_form = html_form + "<br><br>"
            # Add the text input with the name and id attributes
            options.each do |option|
               html_form = html_form + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{option}\"> "
               html_form = html_form + "<label for=\"#{name}\">#{option}</label> "
            end
            html_form = html_form + "<br><br>"
         when "checkbox"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # html_form = html_form + "<br><br>"
            # Add the text input with the name and id attributes
            options.each do |option|
               html_form = html_form + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{option}\"> "
               html_form = html_form + "<label for=\"#{name}\">#{option}</label> "
            end
            html_form = html_form + "<br><br>"
         when "button"
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # html_form = html_form + "<br><br>"
            # Add the text input with the name and id attributes
            html_form = html_form + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{name}\"> "
            html_form = html_form + "<br><br>"
         else
            # Add a label for the text input
            html_form = html_form + "<label for=\"#{name}\">#{label}</label> "
            # html_form = html_form + "<br><br>"
            # Add the text input with the name and id attributes
            html_form = html_form + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\"> "
            html_form = html_form + "<br><br>"
         end
      return html_form
   end

   def submit_form_button(html_form)
      html_form = html_form + "<input type=\"submit\" value=\"Submit\"> "
      # Add a line break after the submit button
      html_form = html_form + "<br><br>"
      # Close the form tag
      html_form = html_form + "</form> "
      html_form = html_form + "<br><br>"
      # Return the completed form HTML
      html_form = html_form + "</body>
      </html> "
      return html_form
   end

   # Method for building the HTML table
   # def build_table
   #    # Start the HTML table tag
   #    table_html = "<table> "
   #    # Iterate over each key-value pair in the form_data hash
   #    @form_data.each do |key, value|
   #       # Add a table row with the key and value
   #       table_html += "<tr><td>#{key}</td><td>#{value}</td></tr> "
   #    end
   #    # Close the table tag
   #    table_html += "</table> "
   #    # Return the completed table HTML
   #    return table_html
   # end

   # # Method for saving the form data to the database
   # def save_data
   #    # Iterate over each key-value pair in the form_data hash
   #    @form_data.each do |key, value|
   #       # Insert the key and value into the database
   #       @db.query("INSERT INTO form_data (name, value) VALUES ('#{key}', '#{value}')")
   #    end
   # end

   # # Method for loading the form data from the database
   # def load_data
   #    # Query the database for all of the form data
   #    results = @db.query("SELECT * FROM form_data")
   #    # Iterate over each row in the results
   #    results.each do |row|
   #       # Add the row's name and value to the form_data hash
   #       @form_data[row["name"]] = row["value"]
   #    end
   # end

   # Method for checking if a field is required
   # def required_field(options)
   #    # Check if the required option is set to true
   #    if options[:required]
   #       # Return the required attribute
   #       return " required"
   #    else
   #       # Return an empty string
   #       return ""
   #    end
   # end
end