FactoryBot.define do
  factory :book do
    name {Faker::Book.title}
    description {Faker::Lorem.sentence(3)}
    detail {Faker::Lorem.paragraph(4)}
    picture {Rack::Test::UploadedFile.new(Rails.root.join("app/assets/images/logo.png"))}
    edition {Faker::Lorem.sentence(2)}
    pages {rand(10..1000)}
    category
    publisher
    author
  end

  factory :invalid_book, parent: :book do
    name {nil}
  end
end
