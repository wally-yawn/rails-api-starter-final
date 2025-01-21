# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Ensure tables are cleared to avoid duplication
User.destroy_all
UserItinerary.destroy_all
Itinerary.destroy_all
ItineraryShow.destroy_all
Show.destroy_all

# Create Users
user1 = User.create!(
  first_name: "Wally",
  last_name: "Wallace",
  email: "wwallace24@turing.edu"
)

user2 = User.create!(
  first_name: "Dahlia",
  last_name: "Wallace",
  email: "dahila@cat.com"
)

# Create Itineraries
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

# Create Shows
show1 = Show.create!(
  name: "The Deceitful Mind",
  date: Date.new(2025, 2, 1),
  time: Time.parse("21:00")
)

show2 = Show.create!(
  name: "Hopefully Soon",
  date: Date.new(2025, 2, 2),
  time: Time.parse("19:00")
)

show3 = Show.create!(
  name: "Iron Maidens",
  date: Date.new(2025, 2, 1),
  time: Time.parse("19:00")
)

show4 = Show.create!(
  name: "The Deceitful Mind",
  date: Date.new(2025, 2, 2),
  time: Time.parse("21:00")
)

# Create ItineraryShows (join table for itineraries and shows)
itinerary_show1 = ItineraryShow.create!(
  itinerary_id: itinerary1.id,
  show_id: show1.id
)

itinerary_show2 = ItineraryShow.create!(
  itinerary_id: itinerary2.id,
  show_id: show2.id
)

itinerary_show3 = ItineraryShow.create!(
  itinerary_id: itinerary3.id,
  show_id: show3.id
)

itinerary_show4 = ItineraryShow.create!(
  itinerary_id: itinerary2.id,
  show_id: show4.id
)

# Create UserItineraries (join table for users and itineraries)
user_itinerary1 = UserItinerary.create!(
  user_id: user1.id,
  itinerary_id: itinerary1.id
)

user_itinerary2 = UserItinerary.create!(
  user_id: user1.id,
  itinerary_id: itinerary2.id
)

user_itinerary3 = UserItinerary.create!(
  user_id: user2.id,
  itinerary_id: itinerary1.id
)
