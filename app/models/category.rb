class Category
  include Mongoid::Document
  field :name
  field :desc

  embedded_in :project

  validates_presence_of :name
end
