# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


lili = User.create(
    username:"Lili",
    email: "lili@lili.com",
    password: "lili123")

david = User.create(
    username:"David",
    email: "david@david.com",
    password: "david123")

ruth = User.create(
    username:"Ruth",
    email: "ruth@ruth.com",
    password: "ruth123")

yoel = User.create(
    username:"Yoel",
    email: "yoel@yoel.com",
    password: "yoel123")

anaelle = User.create(
    username:"Anaelle",
    email: "anaelle@anaelle.com",
    password: "anaelle123")

lionel = User.create(
    username:"Lionel",
    email: "lionel@lionel.com",
    password: "lionel123")

["Nature", "NYC", "Art", "Humor", "Paris", "Beach", "Food"].each do |tag_name|
  Tag.create(name: tag_name)
end

url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"
url2 = "https://goo.gl/images/qTRRIq"

Picture.create(
  image_url: url,
  title: "Saw a dolphin!",
  user_id: User.first.id
)

Picture.create(
  image_url: url2,
  title: "Went to Paris",
  user_id: User.last.id
)

PictureTag.create(picture_id: Picture.first.id, tag_id: Tag.first.id)
PictureTag.create(picture_id: 2, tag_id: 5)
