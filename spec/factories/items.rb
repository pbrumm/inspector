FactoryGirl.define do
  sequence(:name) { |n| "#{n}MyString" }

  factory :item do
    name { FactoryGirl.generate(:name) } 
    survey_id 1
    category "top"
    sub_category "secondary"
    explanation "string"
    scoring 1
    high_score 10
    all_or_nothing false
  end
end
