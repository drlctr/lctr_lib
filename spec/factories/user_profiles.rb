# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_profile do
    user_id 1
    mail_pref_rev true
    mail_pref_rat true
    is_admin false
  end

  factory :user_profile_no_rev do
    user_id 1
    mail_pref_rev false
    mail_pref_rat true
    is_admin false
  end

  factory :user_profile_no_rat do
    user_id 1
    mail_pref_rev true
    mail_pref_rat false
  end

end
