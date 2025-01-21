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
        title: "Metal Bands Day 2",
        date: Date.new(2025, 2, 2),
        img_url: "https://themusicroom.me/wp-content/uploads/2014/10/Nita.jpg"
      )
      
      get "/api/v1/itineraries"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(json[:data].length).to eq(2)
      expect(json[:data][0][:id]).to eq(itinerary1.id)
      expect(json[:data][0][:type]).to eq("itinerary")
      expect(json[:data][0][:attributes][:title]).to eq("CO Bands Day 1")
      expect(json[:data][0][:attributes][:date]).to eq("2025-02-01")
      expect(json[:data][0][:attributes][:img_url]).to eq("https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg")

      expect(json[:data][1][:id]).to eq(itinerary2.id)
      expect(json[:data][1][:type]).to eq("itinerary")
      expect(json[:data][1][:attributes][:title]).to eq("Metal Bands Day 2")
      expect(json[:data][1][:attributes][:date]).to eq("2025-02-02")
      expect(json[:data][1][:attributes][:img_url]).to eq("https://themusicroom.me/wp-content/uploads/2014/10/Nita.jpg")
    end

    it 'does not error when there are no itineraries' do
      Itinerary.destroy_all
      
      get "/api/v1/itineraries"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(json[:data].length).to eq(0)
    end
  end
end