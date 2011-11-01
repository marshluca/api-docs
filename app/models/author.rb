class Author
  include Mongoid::Document

  field :name
  field :email

  embedded_in :project
  embedded_in :doc
  embedded_in :user_log

  validates_presence_of :name, :email
end
