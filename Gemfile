require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'json'
gem 'jquery-rails'
gem "bson_ext", ">= 1.4.0"
gem "mongoid", ">= 2.3.0"
gem "devise", ">= 1.4.7"
gem "haml", ">= 3.1.2"
gem "frontend-helpers"

group :assets do
  # gem 'sass-rails',   '~> 3.1.4'
  # gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

if HOST_OS =~ /linux/i
  gem 'therubyracer', '>= 0.8.2'
end

group :development, :test do
  gem "rspec-rails", ">= 2.6.1"
end

group :development do
  case HOST_OS
  when /darwin/i
    gem 'rb-fsevent'
    gem 'growl'
  when /linux/i
    gem 'libnotify'
    gem 'rb-inotify'
  when /mswin|windows/i
    gem 'rb-fchange'
    gem 'win32console'
    gem 'rb-notifu'
  end

  gem "haml-rails", ">= 0.3.4"
  gem "guard", ">= 0.6.2"
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-livereload", ">= 0.3.0"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
  gem "rails-footnotes", ">= 3.7"
  gem 'bootstrap-generators'
end

group :test do
  gem "database_cleaner", ">= 0.6.7"
  gem "mongoid-rspec", ">= 1.4.4"
  gem "factory_girl_rails", ">= 1.2.0"
  gem "cucumber-rails", ">= 1.1.1"
  gem "capybara", ">= 1.1.1"
  gem "launchy", ">= 2.0.5"
end

group :production do
  gem "memcached", "~> 1.3.5"
  gem "memcache-client", "~> 1.8.5"
end
