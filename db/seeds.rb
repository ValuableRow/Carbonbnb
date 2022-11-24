require 'faker'
require 'open-uri'

puts "dropping database entries"

Booking.destroy_all
Flat.destroy_all
User.destroy_all



puts "creating flats & users &bookinh &reviews"



5.times do |i|
  file = URI.open("https://source.unsplash.com/collection/43146398/")
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Games::Pokemon.name,
    host: true,
    about: Faker::Creature::Dog.meme_phrase,
    location: Faker::Address.full_address
  )
  user.photo.attach(io: file, filename: "user_#{i}_0.jpeg", content_type: "image/jpeg")
  user.save!
end

10.times do |i|
  file = URI.open("https://source.unsplash.com/collection/1340430/")
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    name: Faker::Games::Pokemon.name,
    host: false,
    about: Faker::Creature::Dog.meme_phrase,
    location: Faker::Address.full_address
  )
  user.photo.attach(io: file, filename: "user_#{i}_0.jpeg", content_type: "image/jpeg")
  user.save!
end

5.times do |i|
  file = URI.open("https://source.unsplash.com/collection/1134892/")
  file_2 = URI.open("https://source.unsplash.com/collection/1868256/")
  flat = Flat.new(
    name: Faker::Mountain.range,
    description: Faker::Restaurant.description,
    price_per_night: rand(50..300),
    location: Faker::Address.full_address,
    capacity: rand(2..15),
    user: User.where(host: true).sample
  )
  flat.photos.attach(io: file, filename: "flat_#{i}_0.jpeg", content_type: "image/jpeg")
  flat.photos.attach(io: file_2, filename: "flat_#{i}_1.jpeg", content_type: "image/jpeg")
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
