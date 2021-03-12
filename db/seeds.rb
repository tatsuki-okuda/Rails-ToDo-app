# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


johon = User.create!(email: 'johon1@example.com', password: 'password')
emily = User.create!(email: 'emily1@example.com', password: 'password')


# 10.times do
#   Board.create(
#     name: Faker::Lorem.sentence(word_count: 5),
#     description: Faker::Lorem.sentence(word_count: 100)
#   )
# end

5.times do
  johon.boards.create!(
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100)
  )
  # johon.boards.tasks.create!(
  #   title: Faker::Lorem.sentence(word_count: 5),
  #   content: Faker::Lorem.sentence(word_count: 100),
  #   deadline: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  # )
end

5.times do
  emily.boards.create!(
    name: Faker::Lorem.sentence(word_count: 5),
    description: Faker::Lorem.sentence(word_count: 100)
  )
  # emily.boards.tasks.create!(
  #   title: Faker::Lorem.sentence(word_count: 5),
  #   content: Faker::Lorem.sentence(word_count: 100),
  #   deadline: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  # )
end
