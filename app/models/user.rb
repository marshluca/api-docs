class User
  include Mongoid::Document
  include Mongoid::Paranoia

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name, :type => String
  field :ability, :type => Integer, :default => 0 # 见 app/models/ability.rb
  key :name

  embeds_many :projects # 用户可以查阅的项目

  has_many :docs

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

end

