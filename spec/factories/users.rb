FactoryGirl.define do

  factory :user do
    email Faker::Internet.email
    password "password"
    password_confirmation "password"
    age 28
    username "kamal"
    gender true
    credit_card "12345678"
  end

end
