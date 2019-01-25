FactoryBot.define do
  factory :user do |u|
    u.sequence(:email) { |n| "test@user#{n}.com" }
    u.password 'password'
  end

  factory :location do |u|
    u.sequence(:name) { |n| "location#{n}"}
    u.latitude 1.2345
    u.longitude 6.7890
  end
end
