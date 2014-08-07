class User < ActiveRecord::Base

	validates_presence_of :username, :email
	validates :password, confirmation:  true

	has_many :books
	
end
