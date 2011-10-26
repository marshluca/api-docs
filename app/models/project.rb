class Project
  include Mongoid::Document

  field :name, :type => String
  field :desc, :type => String
  filed :versions, :type => Array

end
