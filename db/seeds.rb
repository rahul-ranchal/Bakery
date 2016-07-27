# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.create(name: "Vegemite Scroll", code: "VS5")
Product.create(name: "Blueberry Muffin", code: "MB11")
Product.create(name: "Croissant", code: "CF")

# packages for products

Product.find(1).packages.create([
    {size: 3, price: 6.99},
    {size: 5, price: 8.99}]
)

Product.find(2).packages.create([
    {size: 2, price: 9.95},
    {size: 5, price: 16.95},
    {size: 8, price: 24.95}]
)

Product.find(3).packages.create([
    {size: 3, price: 5.95},
    {size: 5, price: 9.95},
    {size: 9, price: 16.99}]
)