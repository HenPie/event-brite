# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all

20.times do
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.yoda, email: "#{Faker::Creature::Animal.name}@yopmail.com")
end

10.times do 
  event = Event.create(start_date: Faker::Date.forward(days: 90), duration: 5, title: Faker::Movie.title, description: Faker::Movie.quote, price: Faker::Number.between(from: 1, to: 1000), location: Faker::Nation.capital_city, admin: User.all.sample)
end

10.times do 
  attendance = Attendance.create(stripe_customer_id: Faker::Lorem.sentence(1), user: User.all.sample, event: Event.all.sample)
end

puts "Création des données"