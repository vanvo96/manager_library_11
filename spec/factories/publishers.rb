FactoryBot.define do
  factory :publisher do
    name {Faker::Book.publisher}
    location {Faker::Address.street_address}
  end
end
