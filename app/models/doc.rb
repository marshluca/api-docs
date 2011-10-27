class Doc
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  cache

  field :name, :type => String                  # 名称
  field :path, :type => String                  # 调用path ('-'分割)
  field :url, :type => String                   # 请求url
  field :desc, :type => String                  # 接口描述
  field :format, :type => Array                 # 支持格式 [json|xml]
  field :parameters, :type => Array             # 请求参数
  field :http_method, :type => String           # HTTP请求类型
  field :sample, :type => String                # 返回示例 (嵌入gist)
  field :annotation, :type => String            # 返回字段说明
  field :history, :type => Hash                 # 修改历史
  field :deprecated, :type => Boolean           # 是否弃用
  field :auth, :type => Integer, :default => 0  # 访问权限
  key :path                                     # 标记id

  belongs_to :project
  belongs_to :version
  belongs_to :category
  belongs_to :user

  validates_presence_of :name, :path
  validates_uniqueness_of :name, :path

  def title
    path.gsub('-', '/')
  end
end
