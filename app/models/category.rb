class Category
  include Mongoid::Document

  field :name, type: String

  embedded_in :project

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :docs

end
