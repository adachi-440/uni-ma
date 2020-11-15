FactoryBot.define do
  factory :user, class: User do
    name { 'test' }
    email { 'test@example.com' }
    password { 'testtest' }
    confirmed_at { Time.now }
  end
end
