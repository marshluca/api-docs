require 'factory_girl'

Factory.define :user do |f|
  f.name 'marshluca'
  f.email 'marshluca@gmail.com'
  f.password 'password'
end

Factory.define :project do |f|
  f.name 'share'
  f.cname '易分享'
  f.version 'v1'
  f.desc 'A share app'
  f.author({:id => 'marshluca', :name => 'marshluca', :email => 'marshluca@gmail.com'}.to_json)
end

Factory.define :doc do |f|
  f.name '壁纸列表'
  f.category 'wallpaper'
  f.desc '获取全部的壁纸列表'
  f.path 'wallpaper-list'
  f.url 'http://example.com/v1/wallpapers/list.[format]'
  f.format 'json, xml'
  f.parameters({:typee => 'all'}.to_json)
  f.http_method 'Get'
  f.deprecated false.to_json
  f.authenticated false.to_json
  f.project_id Factory(:project).id
  f.author({:id => 'marshluca', :name => 'marshluca', :email => 'marshluca@gmail.com'}.to_json)
end

Factory.define :user_log do |f|
  #...
end