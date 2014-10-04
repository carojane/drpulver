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

  factory :invalid_ribbit, parent: :ribbit do
    content nil
  end

  factory :student do
  end
end
