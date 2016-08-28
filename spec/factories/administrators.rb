FactoryGirl.define do
  factory :administrator do
    sequence(:email) { |n| "admin#{n}@example.com" }
    sequence(:email_for_index) { |n| "admin#{n}@example.com" }
    password 'pw'
    suspended false
  end
end
