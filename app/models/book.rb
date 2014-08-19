class Book < ActiveRecord::Base

	validates_presence_of :title, :author, :ISBN

	belongs_to :user
	has_many :reviews
	has_attached_file :cover, styles: { small: "150x150>" },
	  url: "/assets/books/:id/:style/:basename.:extension",
	  path: ":rails_root/public/assets/books/:id/:style/:basename.:extension"
	
	validates_attachment_file_name :cover, matches: 
	  [/jpe?g\Z/,/png\Z/,/gif\Z/]
  validates_attachment_presence :cover
  validates_attachment_size :cover, less_than: 5.megabytes



	ratyrate_rateable "user_rating"
	
end
