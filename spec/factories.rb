require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :project do |p|
  p.name 'Test Project'
  p.desc 'a test project'
end

Factory.define :doc do |d|
  d.name 'Test API'
  d.desc 'a test api'
end

Factory.define :user_log do |log|
  #...
end