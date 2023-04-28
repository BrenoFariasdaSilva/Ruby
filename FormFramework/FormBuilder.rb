# Import the MySQL client library
# require 'mysql2'

class FormBuilder
   # Define getter and setter methods for form_fields and form_data
   # attr_accessor :form_fields, :form_data

   # Constructor that takes the action, method and database config as arguments
   # def initialize()
   #    # Store the action and method as instance variables
   #    # @action = action
   #    # @method = method
   #    # Create an empty string to hold the HTML form
   #    @form_fields = []
   #    # Create a new MySQL client object using the provided config
   #    # @db = Mysql2::Client.new(db_config)
   #    # Create an empty hash to hold the form data
   #    @form_data = {}
   # end

   # Method for adding a form field to the form_fields array
   def add_field(type, name, label, options = {})
      # Create a new hash to hold the field's information
      # field = {type: type, name: name, label: label, options: options}
      # Add the field hash to the form_fields array
      # @form_fields << field
   end

   # Method for building the HTML form
   def build_form(type, name, label, options = {})
      form_html = "<!DOCTYPE html>
      <html>
        <head>
          <title>HTML Form</title>
        </head>
        <body>"
      # Start the HTML form tag with the action and method attributes
      # form_html = "<form action=\"#{action}\" method=\"#{method}\">"
      # form_html += "<br>"
      # form_html += "\n"

      # Iterate over each form field in the form_fields array
         case type
            when "text"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"

               form_html += "\n"
               # Add the text input with the name and id attributes
               form_html = form_html + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\">"
            when "textarea"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               form_html = form_html + "<textarea name=\"#{name}\" id=\"#{name}\"></textarea>"
            when "select"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               form_html = form_html + "<select name=\"#{name}\" id=\"#{name}\">"
               form_html += "\n"
               # Add the text input with the name and id attributes
               options.each do |option|
                  form_html = form_html + "<option value=\"#{option}\">#{option}</option>"
                  form_html += "\n"
               end
               form_html = form_html + "</select>"
            when "radio"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               options.each do |option|
                  form_html = form_html + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{option}\">"
                  form_html = form_html + "<label for=\"#{name}\">#{option}</label>"
                  form_html += "\n"
               end
            when "checkbox"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               options.each do |option|
                  form_html = form_html + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{option}\">"
                  form_html = form_html + "<label for=\"#{name}\">#{option}</label>"
                  form_html += "\n"
               end
            when "button"
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               form_html = form_html + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\" value=\"#{name}\">"
               form_html += "\n"
            else
               # Add a label for the text input
               form_html = form_html + "<label for=\"#{name}\">#{label}</label>"
               form_html += "\n"
               # Add the text input with the name and id attributes
               form_html = form_html + "<input type=\"#{type}\" name=\"#{name}\" id=\"#{name}\">"
            form_html += "<br>"
            form_html += "\n"
            end
      # Add the submit button to the form
      form_html += "<input type=\"submit\" value=\"Submit\">"
      # Add a line break after the submit button
      form_html += "<br>"
      # break line \n
      form_html += "\n"

      # Close the form tag
      form_html += "</form>"
      form_html += "<br>"
      form_html += "\n"
      # Return the completed form HTML
      form_html += "  </body>
      </html>"
      return form_html
   end

   # Method for building the HTML table
   # def build_table
   #    # Start the HTML table tag
   #    table_html = "<table>"
   #    # Iterate over each key-value pair in the form_data hash
   #    @form_data.each do |key, value|
   #       # Add a table row with the key and value
   #       table_html += "<tr><td>#{key}</td><td>#{value}</td></tr>"
   #    end
   #    # Close the table tag
   #    table_html += "</table>"
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