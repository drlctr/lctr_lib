class Book < ActiveRecord::Base

	validates_presence_of :title, :author, :ISBN

	belongs_to :user
	has_many :reviews
	
end
