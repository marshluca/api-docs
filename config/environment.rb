# Load the rails application
require File.expand_path('../application', __FILE__)

# Enable vi editing mode for console
if RUBY_PLATFORM =~ /darwin/i
  Readline.try(:vi_editing_mode) rescue nil
end

# Initialize the rails application
Wiki::Application.initialize!
