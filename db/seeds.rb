# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# (1..5).each do |id|
#   User.create!(
# # each user is assigned an id from 1-20
#       id: id+1, 
#       email: Faker::Internet.email,
# # issue each user the same password
#       password: "password", 
#       password_confirmation: "password",
#   )
# # end

# (1..20).each do |id|
#   Post.create!(
#       id: rand(100..200),
#       user_id: rand(2..6), 
#       title: Faker::Hipster.sentences.sample,
#       body: Faker::Lorem.paragraphs 
#   )
# end