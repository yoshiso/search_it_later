# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    sequence(:url){ |n| "http://sample#{n}.com"}
    sequence(:content){ Faker::Lorem.sentence()}
    sequence(:title){|n| "title#{n}"}
  end
end
