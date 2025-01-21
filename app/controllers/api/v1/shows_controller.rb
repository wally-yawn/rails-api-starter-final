class Api::V1::ShowsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

  def destroy
    Show.find(params[:id]).destroy
    render json: { message: 'Show removed successfully' }, status: :ok
  end

  private

  def not_found_response(exception)
    render json: ErrorSerializer.format_error(exception, "404"), status: :not_found
  end  
end