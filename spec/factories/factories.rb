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

  factory :course do
    sequence(:name) { |n| "course#{n}"}
    sequence(:number) { |n| "F#{n}14" }
    meeting_time "M,W,F 8-10"
    description Faker::Lorem.sentence
    syllabus Faker::Lorem.sentence
    start_date do
      from = Time.now.to_f
      to   = 1.months.from_now.to_f
      Time.at(from + rand * (to - from))
    end
    end_date do
      from = 2.months.from_now.to_f
      to   = 2.months.from_now.to_f
      Time.at(from + rand * (to - from))
    end
  end
end
