class UserItinerarySerializer

  def self.format_user_itineraries(user_itineraries, user)
    {
    data: 
      {
        id: user.id,
        type: "user_itineraries",
        attributes: {
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          itineraries: user_itineraries.map do |user_itinerary|
            {
              title: user_itinerary.itinerary.title,
              date: user_itinerary.itinerary.date,
              img_url: user_itinerary.itinerary.img_url,
            }
          end,
        }
      }
    }
  end
end