# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Product.create([
  {
    name: 'Samsung Galaxy S24 Ultra',
    price: 12999.99
  },
  {
    name: 'iPhone 15 Pro Max',
    price: 14999.99
  },
  {
    name: 'Xiamo Mi 27 Pro Plus Master Ultra',
    price: 999.99
  }
])


  product_x = Product.create(name: "Nome do produto X", price: 7.00)
  product_y = Product.create(name: "Nome do produto Y", price: 9.90)
  cart = Cart.create
  CartItem.create(cart: cart, product: product_x, quantity: 2)
  CartItem.create(cart: cart, product: product_y, quantity: 1)