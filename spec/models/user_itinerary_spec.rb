require 'rails_helper'

RSpec.describe UserItinerary, type: :model do
  describe 'relationships' do
    it { should belong_to(:itinerary)}
    it { should belong_to(:user)}
  end
end