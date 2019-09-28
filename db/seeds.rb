# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "====Starting seeding data======"
user1 = User.new(first_name: "aman", last_name: "sharma", email: "aman@yopmail.com", password: "pass1234")

if user1.save
  question = user1.questions.build(content: "What is Black hole?")
  question.save
end

user2 = User.new(first_name: "rohit", last_name: "pandey", email: "rohit@yopmail.com", password: "pass1234")

if user2.save
  question = user2.questions.build(content: "How many types of associations are present in Rails?")
  question.save
end

puts "====Seeding data completed successfully!========"