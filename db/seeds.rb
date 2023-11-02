# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Booking.destroy_all
Table.destroy_all
User.destroy_all
puts "Database tables cleaned"

Table.create!(code: "1", capacity: 4)
Table.create!(code: "C4", capacity: 3)

puts "Tables created"

User.create!(email: "user@example.com",name: "User example", password: "12345678")

puts "User created"