FactoryGirl.define do
  factory :comment do
    content Faker::Lorem.paragraph
    user_id 1
    campaign_id 1
  end
  factory :invalid_comment,class: Comment do
    content ""
    user_id 1
    campaign_id 1
  end
end
