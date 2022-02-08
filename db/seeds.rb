# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

puts 'Creating 20 fake dogs.'
20.times do
  pet = Pet.new(
    name: Faker::Creature::Dog.name,
    address: Faker::Address.city,
    description: Faker::Creature::Dog.meme_phrase,
    price_per_hour: rand(5..5000),
    category: Faker::Creature::Dog.breed
  )
  pet.user = User.first
  pet.save!
end

puts 'Creating 20 fake cats.'
20.times do
  pet = Pet.new(
    name: Faker::Creature::Cat.name,
    address: Faker::Address.city,
    description: Faker::Creature::Cat.registry,
    price_per_hour: rand(5..5000),
    category: Faker::Creature::Cat.breed
  )
  pet.user = User.first
  pet.save!
end
