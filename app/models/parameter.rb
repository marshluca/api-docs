class Parameter
  include Mongoid::Document

  field :name
  field :type
  field :desc
  field :required, :type => Boolean, :default => false

  embedded_in :doc, :inverse_of => :parameters

  validates_presence_of :name
end