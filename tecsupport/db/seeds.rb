# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new
user.username = 'admin'
user.password = "admin"
user.save


299.times do
  user = User.new
  user.username = Faker::Internet.username
  user.password = "user"
  user.save
end

25.times do
  Question.create(
    title: Faker::Lorem.sentence, 
    body: Faker::Lorem.paragraph,
    user_id: 1 + rand(10),
  )
end