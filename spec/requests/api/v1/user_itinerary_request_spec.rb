require 'rails_helper'

RSpec.describe 'Itinerary API', type: :request do
  describe 'index' do
    it 'returns a list of itineraries' do
      # require 'pry'; binding.pry
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

  describe 'show' do
    it 'returns an itinerary when the itinerary is found' do
      Itinerary.destroy_all
      User.destroy_all
      UserItinerary.destroy_all

      itinerary1 = Itinerary.create!(
        title: "CO Bands Day 1",
        date: Date.new(2025, 2, 1),
        img_url: "https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg"
      )

      itinerary2 = Itinerary.create!(
        title: "CO Bands Day 1",
        date: Date.new(2025, 2, 2),
        img_url: "https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg"
      )

      user1 = User.create!(
        first_name: "Wally",
        last_name: "Wallace",
        email: "wwallace24@turing.edu"
      )

      show1 = Show.create!(
        name: "Iron Maidens",
        date: Date.new(2025, 2, 1),
        time: Time.parse("19:00")
      )

      show2 = Show.create!(
        name: "The Deceitful Mind",
        date: Date.new(2025, 2, 1),
        time: Time.parse("21:00")
      )

      itinerary_show1 = ItineraryShow.create!(
        itinerary_id: itinerary1.id,
        show_id: show1.id
      )

      itinerary_show2 = ItineraryShow.create!(
        itinerary_id: itinerary1.id,
        show_id: show2.id
      )

      user_itinerary1 = UserItinerary.create!(
        user_id: user1.id,
        itinerary_id: itinerary1.id
      )

      user_itinerary2 = UserItinerary.create!(
        user_id: user2.id,
        itinerary_id: itinerary1.id
      )

      get "/api/v1/itineraries/#{itinerary1.id}"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(json[:data][:id]).to eq(itinerary1.id)
      expect(json[:data][:type]).to eq("itinerary")
      expect(json[:data][:attributes][:title]).to eq("CO Bands Day 1")
      expect(json[:data][:attributes][:date]).to eq("2025-02-01")
      expect(json[:data][:attributes][:img_url]).to eq("https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg")
      expect(json[:data][:attributes][:users].length).to eq(2)
      expect(json[:data][:attributes][:shows].length).to eq(2)
    end

    it 'returns a 404 if the itinerary is not found' do
      Itinerary.destroy_all

      get "/api/v1/itineraries/1"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to eq("your request could not be completed")
      error = json[:errors].first
      expect(error[:status]).to eq("404")
      expect(error[:title]).to eq("Couldn't find Itinerary with 'id'=1") 
    end
  end
end