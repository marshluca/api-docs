class UserLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :action, :type => Hash

  belongs_to :project
  belongs_to :version
  belongs_to :doc
  belongs_to :user

end
