class Api::V1::ItinerariesController < ApplicationController
  def index
    itineraries = Itinerary.all
    render json: ItinerarySerializer.format_itineraries(itineraries)
  end
end