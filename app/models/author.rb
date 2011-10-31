class Author
  include Mongoid::Document

  field :name
  field :email
  key :name

  embedded_in :project
  embedded_in :doc
  embedded_in :user_log
end
