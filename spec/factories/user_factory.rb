FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@test.com" }
    password 'secredfdaff'
    sequence(:first_name) { |n| "Firstname_#{n}" }
    sequence(:last_name) { |n| "Lastname_#{n}" }

    trait :with_books do
      after(:create) do |user|
        user.books << FactoryGirl.create(:book)
      end
    end
  end
end
