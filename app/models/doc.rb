class Doc
  include Mongoid::Document
  include Mongoid::Timestamps

  cache

  field :name, :type => String                  # 名称
  field :category, :type => String              # 分类
  field :author, :type => Hash                  # 创建作者 {id, name ,email}
  field :path, :type => String                  # 调用path ('-'分割)
  field :url, :type => String                   # 请求url
  field :desc, :type => String                  # 接口描述
  field :format, :type => String                # 支持格式 [json|xml]
  field :parameters, :type => Hash              # 请求参数
  field :http_method, :type => String           # HTTP请求类型
  field :gist_url, :type => String              # 返回示例 (嵌入gist)
  field :annotation, :type => String            # 返回字段说明
  field :deprecated, :type => Boolean           # 是否弃用
  field :authenticated, :type => Boolean        # 是否需要登录认证 (默认不需要)
  field :kind, :type => Integer, :default => 0  # 类型 [doc]
  key :path                                     # 标记id

  referenced_in :project                        # 关联项目
  references_many :user_logs                    # 关联日志

  validates_presence_of :name, :path
  validates_uniqueness_of :path

  def title
    path.gsub('-', '/')
  end
end
