FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@email.com" }
    password "abcd12345"
  end

  factory :ribbit do
    content "Lorem ipsum"
    user
  end

  factory :student do
    first_name "Jane"
    last_name "Smith"
    bio "This is my profile."
    user
  end
end
