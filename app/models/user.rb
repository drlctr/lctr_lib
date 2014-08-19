class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :masqueradable

	validates_presence_of :username

	has_many :books
	has_many :reviews
	has_one :user_profile
	accepts_nested_attributes_for :user_profile

	ratyrate_rater
	
end
