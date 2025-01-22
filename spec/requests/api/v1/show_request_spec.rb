require 'rails_helper'

RSpec.describe 'Show API', type: :request do
  describe 'destroy' do
    it 'destroys shows and itinerary shows' do
      Itinerary.destroy_all

      itinerary1 = Itinerary.create!(
        title: "CO Bands Day 1",
        date: Date.new(2025, 2, 1),
        img_url: "https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg"
      )
      
      itinerary2 = Itinerary.create!(
        title: "Metal Bands Day 2",
        date: Date.new(2025, 2, 2),
        img_url: "https://themusicroom.me/wp-content/uploads/2014/10/Nita.jpg"
      )
      
      show1 = Show.create!(
        name: "Iron Maidens",
        date: Date.new(2025, 2, 1),
        time: Time.parse("19:00")
      )

      itinerary_show1 = ItineraryShow.create!(
        itinerary_id: itinerary1.id,
        show_id: show1.id
      )

      itinerary_show2 = ItineraryShow.create!(
        itinerary_id: itinerary2.id,
        show_id: show1.id
      )

      delete "/api/v1/shows/#{show1.id}"
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to be_successful
      expect(json[:message]).to eq('Show removed successfully')
      expect(Show.exists?(show1.id)).to be_falsey
      expect(ItineraryShow.exists?(itinerary_show1.id)).to be_falsey
      expect(ItineraryShow.exists?(itinerary_show2.id)).to be_falsey
    end

    it 'returns a 404 if the show is not found' do
      Show.destroy_all

      delete "/api/v1/shows/1"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to eq("your request could not be completed")
      error = json[:errors].first
      expect(error[:status]).to eq("404")
      expect(error[:title]).to eq("Couldn't find Show with 'id'=1") 
    end
  end
end