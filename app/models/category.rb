class Category
  include Mongoid::Document

  field :name
  field :desc
  field :count, :type => Integer, :default => 0

  embedded_in :project, :inverse_of => :categories

  validates_presence_of :name
end
