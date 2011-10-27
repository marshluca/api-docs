class Version
  include Mongoid::Document

  field :number, type: Integer
  field :name, type: String

  embedded_in :project

  validates_presence_of :number, :name
  validates_uniqueness_of :number

  has_many :docs
end
