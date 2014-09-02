class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :masqueradable

	validates_presence_of :username

	has_many :roles, through: :users_roles
	has_many :books, dependent: :delete_all
	has_many :reviews, dependent: :delete_all
	has_one :user_profile, dependent: :delete
	accepts_nested_attributes_for :user_profile

	ratyrate_rater
	
end
