class Doc
  include Mongoid::Document
  include Mongoid::Timestamps

  # cache

  field :name                                                # 名称
  field :category                                            # 分类
  field :desc                                                # 接口描述
  field :url                                                 # 请求url
  field :http_method                                         # HTTP请求类型
  field :gist_url                                            # 返回示例 (嵌入gist)
  field :annotation                                          # 返回字段说明
  field :format                                              # 支持格式 [json|xml]
  field :kind, :type => Integer, :default => 0               # 类型 [doc]
  field :deprecated, :type => Boolean, :default => false     # 是否弃用
  field :authenticated, :type => Boolean, :default => false  # 是否需要登录认证 (默认不需要)

  embeds_one :author                                         # 创建作者
  embeds_many :parameters                                    # 请求参数
  embeds_many :comments                                      # 评论列表
  references_many :user_logs                                 # 关联日志
  referenced_in :project, :index => true                     # 关联项目

  index [[:name, Mongo::ASCENDING]], :background => true
  index [[:category, Mongo::ASCENDING]], :background => true

  validates :name, :presence => true #, :uniqueness => true

  default_scope asc('updated_at')

  # after_create :build_insert_log
  # after_update :build_update_log

  private
    def build_insert_log(user)
      user_logs.create :name => 'insert', :desc => '新增了接口', :author => Author.new(:name => user.name, :email => user.email)
    end

    def build_update_log(user)
      user_logs.create :name => 'update', :desc => '修改了接口', :author => Author.new(:name => user.name, :email => user.email)
    end
end
