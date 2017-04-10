# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  user = User.new(
    name: Faker::GameOfThrones.character
    encrypted_password: "password"
    email: Faker::Internet.email
    location: Faker::Address.city
    )
  user.save!
  2.times do
    shoe = Shoe.new(
      name:       Faker::Space.moon
      brand:    %w(nike, puma, supreme, adidas, yohji yamamoto, gucci, chanel).sample
      description: Faker::Friends.quote
      size: (6..12).to_a.sample
      unit_price: (5..20).to_a.sample
      available: "available"
      owner_id:
    )
    shoe.save!
  end
end
