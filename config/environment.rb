# Load the rails application
require File.expand_path('../application', __FILE__)

# Enable vi editing mode for console
if RUBY_PLATFORM =~ /darwin/i
  Readline.try(:vi_editing_mode) rescue nil
end

# Specify the logger
# Rails.logger = Logger.new(STDOUT)
# Rails.logger = Log4r::Logger.new("Application Log")

# Initialize the rails application
Wiki::Application.initialize!
