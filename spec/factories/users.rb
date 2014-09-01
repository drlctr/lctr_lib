# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence :username do |n|
    "user#{n}"
  end

  sequence :email do |n|
    "user#{n}@dummy.com"
  end

  factory :user do
  	username 
  	email 
  	password 'testing22'
  	password_confirmation 'testing22'
  end

  # factory :user_with_book do
  # 	after_create do |user|
  # 		create(:book, user: user)
  # 	end
  # end

  # factory :user_with_book_with_rvw do
  # 	after_create do |user|
  # 		create(:book_with_rvw, user: user)
  # 	end
  # end

  # factory :user_with_rvw do
  # 	after_create do |user|
  # 		create(:review, user: user)
  # 	end
  # end

  # factory :user_with_profile do
  # 	after_create do |user|
  # 		create(:user_profile, user: user)
  # 	end
  # end


end
