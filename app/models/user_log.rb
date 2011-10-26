class UserLog
  include Mongoid::Document

  field :project
  field :version
  field :doc
  field :user
  field :action
  field :created_at

end
