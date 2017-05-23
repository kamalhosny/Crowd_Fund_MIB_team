FactoryGirl.define do
  factory :comment do
    content Faker::Lorem.paragraph
    user_id 25
    campaign_id 25
  end
  factory :invalid_comment,class: Comment do
    content ""
    user_id 25
    campaign_id 25
  end
end
