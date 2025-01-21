class Api::V1::UserItinerariesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def show
    user_itineraries = UserItinerary.find_by(user_id: params[:id])
    require 'pry'; binding.pry
    render json: UserItinerarySerializer.format_itinerary(user_itineraries)
  end

  private

  def not_found_response(exception)
    render json: ErrorSerializer.format_error(exception, "404"), status: :not_found
  end  
end