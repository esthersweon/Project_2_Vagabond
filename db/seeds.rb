# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Post.destroy_all
User.destroy_all
City.destroy_all


user_data = []
3.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  user_data << {
    first_name: first,
    last_name: last,
    email: FFaker::Internet.email,
    current_city: FFaker::Address.city,
    password: "1234",
    image: FFaker::Book.cover,
  }
end
users = User.create(user_data)

city_data = [
  {
    name: "San Francisco",
    image: "sf.jpg"
  },
  {
    name: "London",
    image: "london.jpg"
  },
  {
    name: "Gibraltar",
    image: "gibraltar.jpg"
  },
  {
    name: "New York",
    image: "ny.jpg"
  },
  {
  name: "Atlanta",
  image: "atlanta.jpg"
  },
]
cities = City.create(city_data)

 post_data = []
 20.times do
   user = users.sample
   post_data << {
     title: FFaker::CheesyLingo.title,
     content: FFaker::DizzleIpsum.paragraph,
     user_id: user.id,
     city_id: cities.sample.id,
     author:user.first_name + " " + user.last_name
   }
 end

 random_post = Post.create(post_data)
