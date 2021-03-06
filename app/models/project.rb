class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name                    # 项目名
  field :cname                   # 项目中文名
  field :desc                    # 项目描述
  field :version                 # 项目版本
  field :icon_url                # 项目icon

  embeds_one :author             # 项目创建者
  embeds_many :categories        # 项目分类
  references_many :docs          # 项目关联的docs

  index [[:name, Mongo::ASCENDING], [:version, Mongo::ASCENDING]], :background => true
  index 'categories.name'

  validates_presence_of :name, :cname, :version

  after_create :associate_with_owner

  def associate_with_owner
    User.where(:ability => 2).each do |u|
      u.add_project self.name
    end
  end
end
