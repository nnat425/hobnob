FactoryGirl.define do
  factory :user do
    first_name "Jenny"
    last_name "Lee"
    email "asdfjenny@example.com"
    email_confirmation "asdfjenny@example.com"
    password "password"
  end

  factory :faker_user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
  end

end