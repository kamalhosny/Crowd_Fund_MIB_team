FactoryGirl.define do
  factory :campaign do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    goal 1000
    user_id 1
  end
end
