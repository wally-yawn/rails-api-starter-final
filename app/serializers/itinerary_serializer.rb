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
end