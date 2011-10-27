class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name             # 项目名
  field :cname            # 项目中文名
  field :desc             # 项目描述
  field :icon_url         # 项目icon
  key :name               # 标记id

  embedded_in :user       # 项目创建者
  embeds_many :versions   # 项目包含版本
  embeds_many :categories # 项目包含分类

  has_many :docs

  validates_presence_of :name, :cname
  validates_uniqueness_of :name, :cname

end
