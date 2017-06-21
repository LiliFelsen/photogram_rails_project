# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(username:"Lili", email: "lili@lili.com", password: "lili123")
User.create(username:"David", email: "david@david.com", password: "david123")
User.create(username:"Ruth", email: "ruth@ruth.com", password: "ruth123")
User.create(username:"Yoel", email: "yoel@yoel.com", password: "yoel123")
User.create(username:"Anaelle", email: "anaelle@anaelle.com", password: "anaelle123")
User.create(username:"Lionel", email: "lionel@lionel.com", password: "lionel123")
User.create(username:"Avatar", email: "avatar@avatar.com", password: "avatar123")
User.create(username:"Laure", email: "laure@laure.com", password: "laure123")
User.create(username:"Lovelygirl", email: "lovelygirl@lovelygirl.com", password: "lovelygirl123")

["Nature", "NYC", "Art", "Humor", "Paris", "Beach", "Food", "Sport"].each do |tag_name|
  Tag.create(name: tag_name)
end

url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"

Picture.create(
  image_url: url,
  title: "Saw a dolphin!",
  user_id: User.first.id
)

PictureTag.create(picture_id: Picture.first.id, tag_id: Tag.first.id)
PictureTag.create(picture_id: 2, tag_id: 5)
