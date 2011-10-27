class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  field :name, :type => String
  field :token, :type => String
  field :desc, :type => String

  embeds_many :versions
  embeds_many :categories

  key :token
  index :name, unique: true, background: true

  validates_presence_of :name, :token
  validates_uniqueness_of :name, :token

  has_many :docs
  belongs_to :user

end
