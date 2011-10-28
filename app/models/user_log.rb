class UserLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name                   # 操作名称 (insert, update, destroy ...)
  field :desc                   # 操作描述
  field :author, :type => Hash  # 操作用户 {id, name, email}
  field :log, :type => Hash     # 操作日志 { :insert => '', :update => {}, :destroy => ''}

  embeds_one :action            # 具体操作
  referenced_in :doc            # 关联doc

end
