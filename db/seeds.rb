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

1.times do
  user = User.new(
    name: Faker::GameOfThrones.character,
    password: "password",
    email: Faker::Internet.email,
    location: ["Madrid", "Lisbon", "London", "Rome", "Paris", "Berlin"].sample
    )
  user.save!
  puts "A user has been saved."
  names = ["Airmax Z 667", "Fenty X25", "Skate Hi 1992", "Yeezy Boost 456", "Half Cab 1987", "Retro Hi '72"]
  brands = ["Nike", "Puma", "Supreme", "Adidas", "Yohji Yamamoto", "New Balance"]

  for n in 0..5
    my_brand = brands.first
    brands.shift
    shoe = Shoe.new(
      name:     names.sample,
      brand:    my_brand,
      photo: File.new(Rails.root.join("db/fixtures/#{my_brand.parameterize}.png")),
      description: ["Like new!", "Super Comfortable and Stylish!", "Perfect for everyday!", "Make's you Shine!!", "Super exclusive.", "Beyond Funk"].sample,
      size: (6..12).to_a.sample,
      unit_price: (5..20).to_a.sample,
      owner: user
    )
    shoe.save!
    names.shift
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



