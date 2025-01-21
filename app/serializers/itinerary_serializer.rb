class ItinerarySerializer
  def self.format_itineraries(itineraries)
    {
      data:
      itineraries.map do |itinerary|
        {
          id: itinerary[:id],
          type: "itinerary",
          attributes: {
            title: itinerary[:title],
            date: itinerary[:date],
            img_url: itinerary[:img_url]
          }
        }
      end
    }
  end

  def self.format_itinerary(itinerary)
    {
    data: 
      {
        id: itinerary[:id],
        type: "itinerary",
        attributes: {
          title: itinerary[:title],
          date: itinerary[:date],
          img_url: itinerary[:img_url],
          users: itinerary.users.map do |user|
            {
              id: user.id,
              first_name: user.first_name,
              last_name: user.last_name,
              email: user.email
            }
          end,
          shows: itinerary.shows.map do |show|
            {
              id: show.id,
              name: show.name,
              date: show.date,
              time: show.time
            }
          end,
        }
      }
    }
  end
end