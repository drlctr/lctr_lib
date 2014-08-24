# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username 'Pete'
  	email 'pete@pete.com'
  	password 'testing22'
  	password_confirmation 'testing22'
  end

  factory :bad_user, parent: :user do
  	username ''
  end

end
