class Version
  include Mongoid::Document

  field :name
  field :desc

  auto_increment :number

  embedded_in :project

  has_many :docs

  validates_presence_of :number, :name
  validates_uniqueness_of :number

end
