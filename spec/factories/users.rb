# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    association :organization

    username {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password 'asdasdasd'
    password_confirmation 'asdasdasd'
  end
end
