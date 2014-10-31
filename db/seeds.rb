# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 10.times do
#   User.create!(email: Faker::Internet.email, password: "hunter2" )
# end

# 10.times do
#   Band.create!(name: Faker::Lorem.word)
# end
#
# 20.times do
#   Album.create!(name: Faker::Lorem.word, band_id: (1..10).to_a.sample, album_type: ["Live", "Studio"].sample)
# end
#
# 200.times do
#   Track.create!(name: Faker::Lorem.word, album_id: (1..20).to_a.sample, track_type: ["Bonus", "Regular"].sample, lyrics: Faker::Lorem.paragraph)
# end

800.times do
  Note.create!(description: Faker::Lorem.sentence, track_id: (1..200).to_a.sample, user_id: (1..10).to_a.sample)
end