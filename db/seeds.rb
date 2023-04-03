# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PRODUCTS_AMOUNT = 4
PRODUCT_DESCRIPTION = <<~DESC.squish.freeze
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
  ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco
  laboris nisi ut aliquip ex ea commodo consequat.
DESC

Product.destroy_all

PRODUCTS_AMOUNT.times do |number|
  Product.create(
    name: "Product #{number}",
    description: PRODUCT_DESCRIPTION
  )
end
