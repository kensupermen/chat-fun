# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create name: "abc", email: "abc@gmail.com", password: "123"

10.times do
  User.create(name: FFaker::Name.name, email: FFaker::Internet.free_email, password: "123")
 end

5.times do
  Message.create(title: FFaker::Lorem.word, body: FFaker::Lorem.sentence, sender_id: User.last.id, recipient_id: User.first.id)
end

5.times do
  Message.create(title: FFaker::Lorem.word, body: FFaker::Lorem.sentence, sender_id: User.last.id, recipient_id: User.first.id, read_at: Date.today)
end
