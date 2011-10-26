class Doc
  include Mongoid::Document

  field :project
  field :version
  field :section
  field :name
  field :path
  field :url
  field :format
  field :auth
  field :access
  field :parameters
  field :request
  field :response
  field :annotation

end
