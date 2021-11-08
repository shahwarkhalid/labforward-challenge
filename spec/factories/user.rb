FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@acb.cs"
    end
    password { "password" }
  end
end
