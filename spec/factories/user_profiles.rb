# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_profile do
    user_id 1
    mail_pref_rev false
    mail_pref_rat ""
    is_admin false
  end
end
