require 'rails_helper'

RSpec.describe 'UserItinerary API', type: :request do

  describe 'show' do
    it 'returns a users itineraries when itineraries are found' do
      Itinerary.destroy_all
      User.destroy_all
      UserItinerary.destroy_all

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

      user1 = User.create!(
        first_name: "Wally",
        last_name: "Wallace",
        email: "wwallace24@turing.edu"
      )

      user_itinerary1 = UserItinerary.create!(
        user_id: user1.id,
        itinerary_id: itinerary1.id
      )

      user_itinerary2 = UserItinerary.create!(
        user_id: user1.id,
        itinerary_id: itinerary2.id
      )

      get "/api/v1/user_itineraries/#{user1.id}"
      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful

      expect(json[:data][:id]).to eq(user1.id)
      expect(json[:data][:type]).to eq("user_itineraries")
      expect(json[:data][:attributes][:first_name]).to eq("Wally")
      expect(json[:data][:attributes][:last_name]).to eq("Wallace")
      expect(json[:data][:attributes][:email]).to eq("wwallace24@turing.edu")
      expect(json[:data][:attributes][:itineraries][0][:title]).to eq("CO Bands Day 1")
      expect(json[:data][:attributes][:itineraries][0][:date]).to eq("2025-02-01")
      expect(json[:data][:attributes][:itineraries][0][:img_url]).to eq("https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg")
      expect(json[:data][:attributes][:itineraries][1][:title]).to eq("CO Bands Day 2")
      expect(json[:data][:attributes][:itineraries][1][:date]).to eq("2025-02-02")
      expect(json[:data][:attributes][:itineraries][1][:img_url]).to eq("https://en.wikipedia.org/wiki/File:Flag_of_Colorado.svg")
    end

    it 'returns a 404 if the user is not found' do
      User.destroy_all

      get "/api/v1/user_itineraries/1"
      expect(response).to_not be_successful
      expect(response.status).to eq(404)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:message]).to eq("your request could not be completed")
      error = json[:errors].first
      expect(error[:status]).to eq("404")
      expect(error[:title]).to eq("Couldn't find User with 'id'=1") 
    end
  end
end