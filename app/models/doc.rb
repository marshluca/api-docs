class Doc
  include Mongoid::Document

  field :project  # 项目
  field :version  # 版本
  field :category # 分类
  field :name     # 名称
  field :path     # 调用path
  field :url      # 请求url
  field :desc     # 接口描述
  field :format   # 支持格式[json | xml]
  field :auth     # 访问权限
  field :access
  field :parameters # 请求参数
  field :request
  field :response # 返回内容
  field :annotation # 说明

end
