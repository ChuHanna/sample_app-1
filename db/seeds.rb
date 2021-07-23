# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create! name: Settings.seed.name,
             email: Settings.seed.email,
             password: Settings.seed.password,
             password_confirmation: Settings.seed.password,
             admin: true,
             activated: true,
             activated_at: Time.zone.now

# Generate a bunch of additional users.
Settings.seed.loop.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = Settings.seed.password_2
  User.create! name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take Settings.seed.user_count
Settings.seed.loop.times do
  content = Faker::Lorem.sentence word_count: Settings.seed.word_count
  users.each {|user| user.microposts.create! content: content}
end

# Create following relationships.
users = User.all
user = users.first
following = users[Settings.seed.following_range]
followers = users[Settings.seed.followers_range]
following.each{|followed| user.follow followed}
followers.each{|follower| follower.follow user}
