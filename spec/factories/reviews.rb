# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    book_id 1
    username "MyString"
    email "MyString"
    body "MyText"
  end
end
