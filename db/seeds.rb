# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Hashtag.destroy_all

hashtag_list = [
  { name: "Ruby"},
  { name: "PHP"},
  { name: "CSS"},
  { name: "Javascript"},
  { name: "Java"},
  { name: "C++"}
]

hashtag_list.each do |hashtag|
  Hashtag.create(name: hashtag[:name])
  puts "Hashtag #{hashtag[:name]} was generated."
end

User.create(
  name: 'Admin',
  email: 'admin@example.com',
  password: '123456',
  role: 'admin',
  intro: "I'm Adam",
  )
puts "Default admin created!"