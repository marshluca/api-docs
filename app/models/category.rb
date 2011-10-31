class Category
  include Mongoid::Document
  field :name
  field :token
  field :desc

  embedded_in :project, :inverse_of => :categories

  validates_presence_of :name
end
