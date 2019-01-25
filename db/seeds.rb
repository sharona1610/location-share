# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p 'create first user and location'
User.create!(
  email: 'first@user.com',
  password: 'password'
)

Location.create!(
  name: Faker::FunnyName.name,
  latitude: Faker::Address.latitude,
  longitude: Faker::Address.longitude,
  public: [true, false].sample,
  creator: User.find_by(email: 'first@user.com')
)

p 'create other users'

10.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

p 'create locations'
40.times do
  Location.create!(
    name: Faker::FunnyName.name,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    public: [true, false].sample,
    creator_id: Random.new.rand(1..User.all.count),
    users: [User.find(Random.new.rand(1..User.all.count))]
  )
end
