FactoryGirl.define do
  factory :user do
    email       "abc@gmail.com"
    password    "abcde1234"
  end

  factory :question do
    title   "What is the meaning of life?"
    body    "I have my towel and I'm searching for the meaning of life."
    user
  end
end
