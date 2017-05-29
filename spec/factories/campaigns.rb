FactoryGirl.define do
  factory :campaign do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    goal 2500
    user_id 1
  end

  factory :invalid_campaign, class: Campaign do
    title ''
    description Faker::Lorem.paragraph
    goal 2500
  end

  factory :campaign_updated, class: Campaign do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph
    goal 2500
    status true
  end

end
