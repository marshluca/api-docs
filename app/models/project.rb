class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name                    # 项目名
  field :cname                   # 项目中文名
  field :desc                    # 项目描述
  field :version                 # 项目版本
  field :icon_url                # 项目icon
  field :author, :type => Hash   # 项目创建者 {id, name ,email}
  key :name, :version            # 标记id

  embeds_many :categories        # 项目分类
  references_many :docs          # 项目关联的docs

  validates_presence_of :name, :cname, :version, :author
end
