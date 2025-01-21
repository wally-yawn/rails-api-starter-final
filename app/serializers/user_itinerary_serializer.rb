class ItinerarySerializer

  def self.format_user_itineraries(user_itineraries)
    {
    data: 
      {
        id: user[:id],
        type: "user_itineraries",
        attributes: {
          first_name: user_itineraries.users.first.first_name,
          last_name: user_itineraries.users.first.last_name,
          email: user_itineraries.users.first.email,
          itineraries: user_itineraries.map do |user_itinerary|
            {
              title: user_itinerary.itinerary.title,
              date: user_itinerary.itinerary.date,
              img_url: user_itinerary.itinerary.img_url,
            }
          end
        }
      }
    }
  end
end