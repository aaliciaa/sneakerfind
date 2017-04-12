# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rental.destroy_all
Shoe.destroy_all
User.destroy_all

6.times do
  user = User.new(
    name: Faker::GameOfThrones.character,
    password: "password",
    email: Faker::Internet.email,
    location: ["Tokyo", "New York", "London", "Sydney", "Paris", "Berlin"].sample
    )
  user.save!
  puts "A user has been saved."
  1.times do
    brand = ["Nike", "Puma", "Supreme", "Adidas", "Yohji Yamamoto", "New Balance"].sample
    shoe = Shoe.new(
      name:     ["Airmax Z 667", "Fenty X25", "Skate Hi 1992", "Yeezy Boost 456", "Half Cab 1987", "Retro Hi '72"].sample,
      brand:    brand,
      photo: File.new(Rails.root.join("db/fixtures/#{brand.parameterize}.png")),
      description: Faker::Friends.quote,
      size: (6..12).to_a.sample,
      unit_price: (5..20).to_a.sample,
      owner: user
    )
    shoe.save!
    puts "1 pair of shoes has been created."
  end
end
  puts "All done!"

6.times do
  rental = Rental.new(
    start_date: Faker::Date.forward(2),
    end_date: Faker::Date.forward(10),
    total_cost: (200..500).to_a.sample,
    status: "pending",
    shoe: Shoe.order("RANDOM()").first,
    renter: User.order("RANDOM()").first
    )
  rental.save!
end

