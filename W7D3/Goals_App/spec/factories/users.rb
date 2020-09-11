FactoryBot.define do
  factory :user do
    username {Faker::Creature::Animal.name}
    email {Faker::Internet.email}
    password {"password"}
  end
end
