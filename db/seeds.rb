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

# #Create Categories
# Category.create(name_category: "Fruits")
# Category.create(name_category: "Meat")
# Category.create(name_category: "Vegetables")
# Category.create(name_category: "Frozen")
# Category.create(name_category: "Bakery")
# Category.create(name_category: "Organic")
# Category.create(name_category: "Baby")
# Category.create(name_category: "Health")
# Category.create(name_category: "Household")

#Create Items in Stocks
# Stock.create(name_item: "Gala Apples", barcode: 8872732043556, price: 2.60, category_id: 1, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/IMG1500_1411027151192.JPG")
# Stock.create(name_item: "Packham Pears", barcode: 8887273043272, price: 3.35, category_id: 1, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/IMG1501_1411025931292.JPG")
# Stock.create(name_item: "Chicken Boneless Breast 300g", barcode: 881223456789, price: 6.50, category_id: 2, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/8888442100937_0066_1508835070590.jpg")
# Stock.create(name_item: "Spinach", barcode: 887211111122, price: 1.75, category_id: 3, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/8886475900111_0001_1509090811074.jpg")
# Stock.create(name_item: "Magnum Mini Classic Almond White Multipack Ice Cream", barcode: 887273204355, price: 8.70, category_id: 4, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/MAGNUMIHMINICLASSICALMONDWHITE6_1479268572838.jpg")
# Stock.create(name_item: "Gardenia Enriched White Bread", barcode: 8888247111114, price: 2.00, category_id: 5, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/8888247111114_0033_1496980452178.jpg")
# Stock.create(name_item: "Organic 4 Life Organic Carrots", barcode: 123456789012, price: 4.85, category_id: 6, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/Carrots_1426045727815.JPG")
# Stock.create(name_item: "Bonlife Bonmil Organic Growing Up 3+ Stage 4 Milk Powder", barcode: 888842651967, price: 48, category_id: 7, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/IMG_7164.JPG")
# Stock.create(name_item: "Blackmores Vitamin C 500", barcode: 888872763643, price: 11.20, category_id: 8, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/93460279_0001_1499437714094.jpg")
# Stock.create(name_item: "Onwards 3-Ply Toilet Tissue", barcode: 887273289435, price: 5.90, category_id: 9, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/IMG_10314A.JPG")
Stock.create(name_item: "Dettol Sensitive Personal Care Wipes", barcode: 6001106126438, price: 1.94, category_id: 9, img:"https://s3-ap-southeast-1.amazonaws.com/media.redmart.com/newmedia/1600x/i/m/unnamed_1489401732992.jpg")
