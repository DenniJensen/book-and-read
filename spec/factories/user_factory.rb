FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test{n}@test.com" }
    password 'secredfdaff'
    sequence(:first_name) { |n| "Firstname_{n}" }
    sequence(:last_name) { |n| "Lastname_{n}" }
  end
end
