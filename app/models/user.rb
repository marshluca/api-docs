class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Gravtastic

  gravtastic :secure => true,
             :filetype => :png,
             :size => 120

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :name
  field :projects, :type => Array, :default => []    # 可以查看的项目
  field :ability, :type => Integer, :default => 0    # 见 app/models/ability.rb
  key :name                                          # 标记id

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
end
