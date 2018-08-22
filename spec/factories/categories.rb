FactoryBot.define do
  factory :category do
    name {Faker::Book.genre}
    description {Faker::Book.title}
  end
end
