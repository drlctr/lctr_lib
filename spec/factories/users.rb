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

end
