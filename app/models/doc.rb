class Doc
  include Mongoid::Document

  field :project  # 项目
  field :version  # 版本
  field :category # 分类
  field :name     # 名称
  field :path     # 调用path
  field :url      # 请求url
  field :desc     # 接口描述
  field :format   # 支持格式 [json | xml]
  field :auth     # 访问权限
  field :parameters  # 请求参数
  field :http_method # HTTP请求类型
  field :sample      # 返回示例, 嵌入gist
  field :annotation  # 返回字段说明
  field :deprecated   # 是否弃用
  field :updated_at  # 更新时间
  field :created_at  # 创建时间

end
