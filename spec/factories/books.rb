# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :book do
    title "MyString"
    author "MyString"
    ISBN 1
    cover {fixture_file_upload(Rails.root.join('spec','covers','test.jpg'),'image/jpg')} 
  end

  factory :bad_book, parent: :book do
    title ""
  end

  factory :book_with_rvw do
  	after_create do |book|
  		create(:review, book: book)
  	end
  end

end
