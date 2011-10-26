class Project
  include Mongoid::Document

  field :name, :type => String
  field :desc, :type => String
  field :versions, :type => Array

end
