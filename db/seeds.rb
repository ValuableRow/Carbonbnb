require 'faker'

puts "dropping database entries"

Booking.destroy_all
Flat.destroy_all
User.destroy_all



puts "creating flats & users &bookinh &reviews"



50.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Games::Pokemon.name,
    host: true,
    about: Faker::Creature::Dog.meme_phrase,
    location: Faker::Address.full_address,
  )
  user.save!
end

20.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Games::Pokemon.name,
    host: false,
    about: Faker::Creature::Dog.meme_phrase,
    location: Faker::Address.full_address,
  )
  user.save!
end

50.times do
  flat = Flat.new(
    name: Faker::Mountain.range,
    description: Faker::Restaurant.description,
    price_per_night: rand(50..300),
    photos: "https://source.unsplash.com/collection/1134892/",
    location: Faker::Address.full_address,
    capacity: rand(2..15),
    carbon_footprint: rand(10..50),
    user: User.where(host: true).sample
  )
  flat.save!
end

50.times do
  start_date = Faker::Date.in_date_period
  flat = Flat.all.sample
  end_date = start_date + rand(1..10)
  duration = end_date - start_date
  total_price = flat.price_per_night * duration

  booking = Booking.new(
    confirmed: true,
    start_date: start_date,
    end_date: end_date,
    total_price: total_price,
    flat: flat,
    user: User.where(host: false).sample,
  )
  booking.save!
end

Booking.all.each do |booking|
  if booking.end_date.past?
    rating = Rating.new(
      rating: rand(0..5),
      comment: Faker::TvShows::HowIMetYourMother.quote,
      booking: booking
    )
    rating.save!
  end
end

puts "finished!"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
