FactoryBot.define do
  factory :author do
    name {Faker::Book.author}
    description {Faker::Lorem.sentence(3)}
    detail {Faker::Lorem.paragraph(3)}
  end
end
