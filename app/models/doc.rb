class Doc
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  cache

  field :version             # 版本
  field :name                # 名称
  field :path                # 调用path
  field :url                 # 请求url
  field :category            # 分类
  field :desc                # 接口描述
  field :format              # 支持格式 [json|xml]
  field :auth                # 访问权限
  field :parameters          # 请求参数
  field :http_method         # HTTP请求类型
  field :sample              # 返回示例 (嵌入gist)
  field :annotation          # 返回字段说明
  field :history             # 修改历史
  field :deprecated          # 是否弃用

  key :path # http://mongoid.org/docs/extras.html
  index :name, unique: true, background: true
  index :path, unique: true, background: true

  validates_presence_of :name, :author, :path, :category
  validates_uniqueness_of :name, :path

  belongs_to :project
  belongs_to :user

end
