class Doc
  include Mongoid::Document

  field :version
  field :section
  field :name
  field :path
  field :url
  field :format
  field :request
  field :auth
  field :access
  field :parameters
  field :response
  field :annotation
end
