# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require "faker"

# 5.times do
#   User.create(
#     email: Faker::Internet.free_email,
#   )
# end

# 5.times do
#   Category.create(
#   )
# end

# 5.times do
#   Stock.create(
#     name_item: Faker::Food.ingredient,
#     barcode: Faker::Code.ean ,
#     price: Faker::Commerce.price  ,
#     quantity: 99,
#     category_id: 1
#   )
# end
#
# 2.times do
#   Shoppinglist.create(
#     user_id: 1,
#     paid_on: Faker::Time.between(DateTime.now - 1, DateTime.now)
#   )
# end

# Stock.create(
#     name_item: "Kellogg's Conflakes 150g",
#     barcode: 8852756303056,
#     price: 2.99,
#     category_id: 1
#   )

  Category.create(
    name_category: "organic"
  )
