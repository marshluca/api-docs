class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :desc, :type => String

  embedded_in :user       # 项目创建者
  embeds_many :versions   # 项目包含版本
  embeds_many :categories # 项目包含分类

  index :name, unique: true, background: true

  validates_presence_of :name, :user
  validates_uniqueness_of :name

  has_many :docs

end
