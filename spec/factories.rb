require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :doc do |d|
  d.name 'Test API'
  d.desc 'a test api'
end
