FactoryGirl.define do

  factory :campaign do
    title Faker::Lorem.sentence
    discription Faker::Lorem.paragraph
    gaol 1000
  end

end
