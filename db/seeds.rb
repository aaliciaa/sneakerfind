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

20.times do
  user = User.new(
    name: Faker::GameOfThrones.character,
    password: "password",
    email: Faker::Internet.email,
    location: Faker::Address.city
    )
  user.save!
  puts "A user has been saved."
  2.times do
    brand = ["Nike", "Puma", "Supreme", "Adidas", "Yohji Yamamoto", "New Balance"].sample
    shoe = Shoe.new(
      name:       Faker::Space.moon,
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

5.times do
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

