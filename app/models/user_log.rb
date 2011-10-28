class UserLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: Hash  # 操作用户 {id, name, email}

  embeds_one :action         # 具体操作
  referenced_in :doc         # 关联doc

end
