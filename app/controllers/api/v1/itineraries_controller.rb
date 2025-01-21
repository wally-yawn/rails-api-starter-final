class Api::V1::ItinerariesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def index
    itineraries = Itinerary.all
    render json: ItinerarySerializer.format_itineraries(itineraries)
  end

  def show
    # require 'pry'; binding.pry
    itinerary = Itinerary.find(params[:id])
    render json: ItinerarySerializer.format_itinerary(itinerary)
  end

  private

  def not_found_response(exception)
    render json: ErrorSerializer.format_error(exception, "404"), status: :not_found
  end  
end