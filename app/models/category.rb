class Category
  include Mongoid::Document

  field :name, type: String

  embedded_in :project

  has_many :docs

end
