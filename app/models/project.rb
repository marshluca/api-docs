class Project
  include Mongoid::Document

  field :name, :type => String
  filed :versions, :type => Array

end
