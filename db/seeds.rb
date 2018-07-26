10.times do |n|
  name = Faker::Book.genre
  description = Faker::Book.title
  Category.create!(name: name, description: description)
end

10.times do |n|
  name = Faker::Book.publisher
  location = Faker::Address.street_address
  Publisher.create!(name: name, location: location)
end

10.times do |n|
  name = Faker::Book.author
  description = Faker::Lorem.sentence(3)
  detail = Faker::Lorem.paragraph(3)
  Author.create!(name: name, description: description, detail: detail)
end
