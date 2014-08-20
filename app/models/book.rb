class Book < ActiveRecord::Base



	belongs_to :user
	has_many :reviews
	has_attached_file :cover, styles: { small: "150x150>" },
	  url: "/assets/books/:id/:style/:basename.:extension",
	  path: ":rails_root/public/assets/books/:id/:style/:basename.:extension"
	
  default_scope { order("title ASC")}
  scope :submitted, -> {where(status: 'submitted')}
  scope :approved, -> {where(status: 'approved')}
  scope :deactivated, -> {where(status: 'deactivated')}


	validates_presence_of :title, :author, :ISBN	
	validates_attachment_file_name :cover, matches: 
	  [/jpe?g\Z/,/png\Z/,/gif\Z/]
  validates_attachment_presence :cover
  validates_attachment_size :cover, less_than: 5.megabytes



	ratyrate_rateable "user_rating"
	
end
