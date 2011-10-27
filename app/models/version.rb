class Version
  include Mongoid::Document

  field :number, type: Integer
  field :country, type: String

  embedded_in :project

  has_many :docs
end
