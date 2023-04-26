# Import the MySQL client library
require 'mysql2'

class FormBuilder
  # Define getter and setter methods for form_fields and form_data
  attr_accessor :form_fields, :form_data

  # Constructor that takes the action, method and database config as arguments
  def initialize(action, method, db_config)
    # Store the action and method as instance variables
    @action = action
    @method = method
    # Create an empty array to hold the form fields
    @form_fields = []
    # Create a new MySQL client object using the provided config
    @db = Mysql2::Client.new(db_config)
    # Create an empty hash to hold the form data
    @form_data = {}
  end

  # Method for adding a form field to the form_fields array
  def add_field(type, name, label, options = {})
    # Create a new hash to hold the field's information
    field = {type: type, name: name, label: label, options: options}
    # Add the field hash to the form_fields array
    @form_fields << field
  end

  # Method for building the HTML form
  def build_form
    # Start the HTML form tag with the action and method attributes
    form_html = "<form action=\"#{@action}\" method=\"#{@method}\">"
    # Iterate over each form field in the form_fields array
    @form_fields.each do |field|
      # Use a case statement to handle each type of form field
      case field[:type]
      when "text"
        # Add a label for the text input
        form_html += "<label for=\"#{field[:name]}\">#{field[:label]}</label>"
        # Add the text input with the name and id attributes
        form_html += "<input type=\"#{field[:type]}\" name=\"#{field[:name]}\" id=\"#{field[:name]}\"#{required_field(field[:options])}>"
      when "textarea"
        # Add a label for the textarea
        form_html += "<label for=\"#{field[:name]}\">#{field[:label]}</label>"
        # Add the textarea with the name and id attributes
        form_html += "<textarea name=\"#{field[:name]}\" id=\"#{field[:name]}\"#{required_field(field[:options])}></textarea>"
      when "checkbox"
        # Add a label for the checkbox group
        form_html += "<label>#{field[:label]}</label>"
        # Iterate over each checkbox option
        field[:options].each do |option|
          # Add the checkbox with the name, value and id attributes
          form_html += "<input type=\"#{field[:type]}\" name=\"#{field[:name]}[]\" value=\"#{option[:value]}\"#{required_field(field[:options])}>#{option[:label]}"
        end
      when "radio"
        # Add a label for the radio button group
        form_html += "<label>#{field[:label]}</label>"
        # Iterate over each radio button option
        field[:options].each do |option|
          # Add the radio button with the name, value and id attributes
          form_html += "<input type=\"#{field[:type]}\" name=\"#{field[:name]}\" value=\"#{option[:value]}\"#{required_field(field[:options])}>#{option[:label]}"
        end
      when "select"
        # Add a label for the select menu
        form_html += "<label for=\"#{field[:name]}\">#{field[:label]}</label>"
        # Add the select
	form_html += "<select name=\"#{field[:name]}\" id=\"#{field[:name]}\"#{required_field(field[:options])}>"
        field[:options].each do |option|
          form_html += "<option value=\"#{option[:value]}\">#{option[:label]}</option>"
        end
        form_html += "</select>"
      end
    end
    form_html += "<input type=\"submit\" value=\"Submit\">"
    form_html += "</form>"
    return form_html
  end

  def process_form(params)
    @form_fields.each do |field|
      if params.key?(field[:name])
        if field[:type] == "checkbox"
          @form_data[field[:name]] = params[field[:name]].join(",")
        else
          @form_data[field[:name]] = params[field[:name]]
        end
      end
    end
    insert_data
  end

  def insert_data
    fields = @form_data.keys.join(",")
    values = @form_data.values.map { |value| "'#{value}'" }.join(",")
    sql = "INSERT INTO form_data (#{fields}) VALUES (#{values})"
    @db.query(sql)
  end

  private

  def required_field(options

