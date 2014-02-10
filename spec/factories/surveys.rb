# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey do
    name "MyString"
    user_id 1
    site_id 1
    inspection_id 1
  end
end
