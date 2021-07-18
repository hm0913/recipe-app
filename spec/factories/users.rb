FactoryBot.define do
  factory :user do
    name                  {"abe"}
    password              {"111111"}
    password_confirmation {"111111"}
    sequence(:email) {Faker::Internet.email}

    trait :invalid_user do
      name {nil}
    end
  end

  factory :bob, class: User do
    name {"bob"}
    email {"bob@example.com"}
    password              {"222222"}
    password_confirmation {"222222"}
  end
end