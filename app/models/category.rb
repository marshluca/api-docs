class Category
  include Mongoid::Document

  field :name
  field :desc

  embedded_in :project

  has_many :docs

  validates_presence_of :name
  validates_uniqueness_of :name

end
