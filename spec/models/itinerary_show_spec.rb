require 'rails_helper'

RSpec.describe ItineraryShow, type: :model do
  describe 'relationships' do
    it { should belong_to(:itinerary)}
    it { should belong_to(:show)}
  end
end