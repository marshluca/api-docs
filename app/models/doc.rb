class Doc
  include Mongoid::Document
  include Mongoid::Timestamps

  # cache

  field :name, :type => String                               # 名称
  field :desc, :type => String                               # 接口描述
  field :url, :type => String                                # 请求url
  field :format, :type => String                             # 支持格式 [json|xml]
  field :http_method, :type => String                        # HTTP请求类型
  field :gist_url, :type => String                           # 返回示例 (嵌入gist)
  field :annotation, :type => String                         # 返回字段说明
  field :kind, :type => Integer, :default => 0               # 类型 [doc]
  field :parameters, :type => Hash, :default => {}           # 请求参数
  field :deprecated, :type => Boolean, :default => false     # 是否弃用
  field :authenticated, :type => Boolean, :default => false  # 是否需要登录认证 (默认不需要)

  embeds_one :author                                         # 创建作者
  embeds_one :category                                       # 分类
  references_many :user_logs                                 # 关联日志
  referenced_in :project, :index => true                     # 关联项目

  index [[:name, Mongo::ASCENDING]], :background => true
  index 'category.name'

  validates :name, :presence => true, :uniqueness => true
end
