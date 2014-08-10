class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :username
	# validates :email, format: 
	#   {with: /\A.+@.+\..+\z/, message:
	#     "Does not appear to be a valid email address"}
	validates :password, confirmation:  true, format:  
	  {with: /\A(?=.*(\d|\W)).{8,20}\z/, message: "requires at least eight
	   characters, at least one number or non-alphanumeric"}

	has_many :books
	
end
