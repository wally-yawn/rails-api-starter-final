class Api::V1::UserItinerariesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def show
    user_itineraries = UserItinerary.where(user_id: params[:id])
    user = User.find(params[:id])
    # require 'pry'; binding.pry
    render json: UserItinerarySerializer.format_user_itineraries(user_itineraries, user)
  end

  private

  def not_found_response(exception)
    render json: ErrorSerializer.format_error(exception, "404"), status: :not_found
  end  
end