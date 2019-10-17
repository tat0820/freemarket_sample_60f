# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Product.create(
  name: "うまい棒",
  discription: "don't think. feel.",
  condition: "未使用に近い",
  delivery_charge: "出品者",
  origin_area: "america",
  days_left_send: "1~2日",
  price: "30",
  status: "出品中",
)

Detail.create(
  large_category: "レディース",
  medium_category: "トップス",
  small_category: "ビヨンセ",
  size: "S",
  brand: "ビヨンセ",
  product_id: "1",
)

Image.create(
  img: "https://images-na.ssl-images-amazon.com/images/I/41Wg%2B7BHmUL._SX425_.jpg"
  product_id: "1",
)
