require 'rails_helper'

RSpec.describe 'Itinerary API', type: :request do
  describe 'index' do
    it 'returns a list of itineraries' do
      Itinerary.destroy_all
      
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
      
      get "/api/v1/itineraries"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful


    end
  end
end