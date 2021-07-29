# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

10.times do |index|
  user = User.create!(username: Faker::Name.name)
    4.times do |index|
      Cocktail.create!(name: Faker::Beer.name,
                    ingredients: Faker::Food.description,
                    user_id: user.id)
    end
end

p "Created #{User.count} users and #{Cocktail.count} cocktails."