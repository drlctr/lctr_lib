class Book < ActiveRecord::Base

	validates_presence_of :title, :author, :ISBN
	
end
