# Load the rails application
require File.expand_path('../application', __FILE__)

#initialize custom config variables
APP_CONFIG = YAML.load_file("#{Rails.root}/config/settings.yml")[Rails.env]

# Initialize the rails application
Communal2::Application.initialize!


