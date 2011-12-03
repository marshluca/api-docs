# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

# puts 'EMPTY THE MONGODB DATABASE'
# Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
# puts 'SETTING UP DEFAULT USER LOGIN'

__END__
user = User.create! :name => 'admin', :email => 'admin@example.com', :password => 'secret', :password_confirmation => 'secret'
puts 'New user created: ' << user.name

project = Project.create! :name => 'share', :cname => '易分享', :version => 'v1', :desc => 'www.yfx365.com', :author => Author.new(:name => user.name, :email => user.email), :categories => [Category.new(:name => '壁纸'), Category.new(:name => '铃声'), Category.new(:name => '笑话'), Category.new(:name => '短信'), Category.new(:name => '应用'), Category.new(:name => '游戏'), Category.new(:name => '动态'), Category.new(:name => '达人'), Category.new(:name => '用户'), Category.new(:name => '搜索')]
puts 'New project created: ' << project.name

%w(wallpapers/recommend wallpapers/popular wallpapers/recent wallpapers/mine ringtones/recommend ringtones/popular ringtones/recent ringtones/mine).each do |i|
  Doc.create! :name => i, :format => ['json', 'xml'], :http_method => 'Get', :project_id => project.id, :desc => '获取壁纸列表数据', :url => "http://ws.yfx365.com/v1/#{i}", :author => project.author, :category => project.categories.first.name
  puts
end

%w(ringtones/recommend ringtones/popular ringtones/recent ringtones/mine).each do |i|
  d = Doc.create! :name => i, :format => ['json', 'xml'], :http_method => 'Get', :project_id => project.id, :desc => '获取铃声列表数据', :url => "http://ws.yfx365.com/v1/#{i}", :author => project.author, :category => project.categories[1].name
  puts 'New document created: ' << d.name
end


project = Project.create! :name => 'share', :cname => '易分享', :version => 'v2', :desc => 'www.yfx365.com', :author => Author.new(:name => user.name, :email => user.email), :categories => [Category.new(:name => '壁纸'), Category.new(:name => '铃声'), Category.new(:name => '笑话'), Category.new(:name => '短信'), Category.new(:name => '应用'), Category.new(:name => '游戏'), Category.new(:name => '动态'), Category.new(:name => '达人'), Category.new(:name => '用户'), Category.new(:name => '搜索')]
puts 'New project created: ' << project.name

%w(wallpapers/recommend wallpapers/popular wallpapers/recent wallpapers/mine ringtones/recommend ringtones/popular ringtones/recent ringtones/mine).each do |i|
  Doc.create! :name => i, :format => ['json', 'xml'], :http_method => 'Get', :project_id => project.id, :desc => '获取壁纸列表数据', :url => "http://ws.yfx365.com/v1/#{i}", :author => project.author, :category => project.categories.first.name
  puts
end

%w(ringtones/recommend ringtones/popular ringtones/recent ringtones/mine).each do |i|
  d = Doc.create! :name => i, :format => ['json', 'xml'], :http_method => 'Get', :project_id => project.id, :desc => '获取铃声列表数据', :url => "http://ws.yfx365.com/v1/#{i}", :author => project.author, :category => project.categories[1].name
  puts 'New document created: ' << d.name
end
