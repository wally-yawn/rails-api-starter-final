# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# User.destroy_all
# User_itinerary.destroy_all
# Itinerary.destroy_all
# Itinerary_show.destroy_all
# Show.destroy_all

user1 = User.create!(
  first_name:  "Wally",
  last_name: "Wallace",
  email: "wwallace24@turing.edu"
)

user2 = User.create!(
  first_name:  "Dahlia",
  last_name: "Wallace",
  email: "dahila@cat.com"
)

itinerary1 = Itinerary.create!(
  title: "CO Bands Day 1",
  date: Date.new(2025, 2, 1),
  img_url: "https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg"
)

itinerary2 = Itinerary.create!(
  title: "CO Bands Day 2",
  date: Date.new(2025, 2, 2),
  img_url: "https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg"
)

itinerary3 = Itinerary.create!(
  title: "Metal Bands Day 1",
  date: Date.new(2025, 2, 1),
  img_url: "https://themusicroom.me/wp-content/uploads/2014/10/Nita.jpg"
)

show1 = Show.create!(
  name: "The Deceitful Mind",
  date: Date.new(2025, 2, 1),
  time: Time.pars("21:00")
)

show2 = Show.create!(
  name: "Hopefully Soon",
  date: Date.new(2025, 2, 2),
  time: Time.pars("19:00")
)

show3 = Show.create!(
  name: "Iron Maidens",
  date: Date.new(2025, 2, 1),
  time: Time.pars("19:00")
)

show4 = Show.create!(
  name: "The Deceitful Mind",
  date: Date.new(2025, 2, 2),
  time: Time.pars("21:00")
)

itinerary_show1 = Itinerary_show.create!(
  itinerary = itinerary1,
  show = show1
)

itinerary_show2 = Itinerary_show.create!(
  itinerary = itinerary2,
  show = show2
)

itinerary_show3 = Itinerary_show.create!(
  itinerary = itinerary3,
  show = show3
)

itinerary_show4 = Itinerary_show.create!(
  itinerary = itinerary2,
  show = show4
)

user_itinerary1 = User_Itinerary.create!(
  user = user1,
  itinerary = itinerary1
)

user_itinerary2 = User_Itinerary.create!(
  user = user1,
  itinerary = itinerary2
)

user_itinerary3 = User_Itinerary.create!(
  user = user2,
  itinerary = itinerary1
)