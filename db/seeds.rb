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
