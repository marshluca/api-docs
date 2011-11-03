class Author
  include Mongoid::Document
  include Gravtastic
  gravtastic :secure => true,
             :filetype => :png,
             :size => 40

  field :name
  field :email

  embedded_in :project
  embedded_in :doc
  embedded_in :user_log

  validates_presence_of :name, :email
end
