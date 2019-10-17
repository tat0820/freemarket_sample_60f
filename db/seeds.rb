# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Product.create(
  name: "beyonce",
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
  product_id: "6",
)

Image.create(
  img: "https://www.google.com/url?sa=i&source=images&cd=&ved=2ahUKEwiW676n453lAhWlL6YKHYIEBq0QjRx6BAgBEAQ&url=http%3A%2F%2Fwww.yogakuhack.com%2Fentry%2Fsingleladies_beyonce&psig=AOvVaw1AI5BhJGE2uzCR5wx7SYak&ust=1571212037456298",
  img: "https://i1.wp.com/lmusic.tokyo/wp-content/uploads/2019/07/BeyonceLionKing-720x480-3.jpg?fit=720%2C480&ssl=1",
  img: "https://www.etonline.com/sites/default/files/styles/max_970x546/public/images/2019-04/1280beyonce.jpg?itok=m9uuCl46&h=c673cd1c",
  img: "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/ih7f9_9rOi18/v0/1000x-1.jpg",
  img: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/beyonce-1554742143.jpg?crop=0.502xw:1.00xh;0.270xw,0&resize=480:*",
  img: "https://static.accessonline.com/uploads/2019/07/190718_3990669_Beyonce_s_Unforgettable_Fashion_Moments_And__anvver_1_800x450_1573278275852.jpg",
  img: "https://media4.s-nbcnews.com/j/newscms/2018_32/1357979/beyonce-vogue-gold-today_180806-mainart_7a701d9522f097a15118e785249579d2.fit-760w.jpg",
  img: "https://rockinon.com/images/artist_image/width:600/230/1",
  img: "https://www.madametussauds.jp/media/507746/ba_beyonce_after_962x540.jpg?anchor=center&mode=crop&width=962&height=540",
  
  product_id: "6",
)
