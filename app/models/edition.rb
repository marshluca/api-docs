class Edition
  include Mongoid::Document

  field :name
  field :desc

  auto_increment :version

  embedded_in :project

  has_many :docs

  validates_presence_of :version, :name
  validates_uniqueness_of :number

end
