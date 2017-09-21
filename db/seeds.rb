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
    password: "1234"
  }
end
users = User.create(user_data)
i = 0
post_data = []
3.times do
  post_data << {
    title: FFaker::CheesyLingo.title,
    content: FFaker::CheesyLingo.sentence,
    author: (users[i].first_name + " " + users[i].last_name)
  }
  i = i +1
end
city_data = []
 City.create(name: "San Francisco", image: "sf.jpg")
 City.create(name: "New York", image: "ny.jpg")
 City.create(name: "Atlanta", image: "atlanta.jpg")
random_post = Post.create(post_data)

users[0].posts << random_post[0]
users[1].posts << random_post[1]
users[2].posts << random_post[2]
