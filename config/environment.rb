# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Dizsuggest::Application.initialize!

Haml::Template.options[:escape_attrs] = false