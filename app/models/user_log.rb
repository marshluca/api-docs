class UserLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name                         # 操作名称 (insert, update, destroy ...)
  field :desc                         # 操作描述 (插入, 修改, 删除)
  field :log                          # 操作日志 (具体修改内容)

  embeds_one :author                  # 操作用户
  referenced_in :doc, :index => true  # 关联doc

  index 'author.name'

  validates_presence_of :name

  default_scope desc('updated_at')
end
