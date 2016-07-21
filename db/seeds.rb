# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username: "sam", password: "aaaaaa")
User.create!(username: "apple", password: "aaaaaa")
User.create!(username: "pope", password: "aaaaaa")

User.all.each do |user|
  rand(5).times do
    user.logs.create!
  end
end
