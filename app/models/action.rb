class Action
  include Mongoid::Document

  field :name                # 操作名称 (insert, update, destroy ...)
  field :desc                # 操作描述
  field :log, type: Hash     # 操作日志 { :insert => '', :update => {}, :destroy => ''}

  embedded_in :user_log

  validates_presence_of :name, :desc
end
