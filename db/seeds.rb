10.times do |n|
  name = Faker::Book.genre
  description = Faker::Book.title
  Category.create!(name: name, description: description)
end
