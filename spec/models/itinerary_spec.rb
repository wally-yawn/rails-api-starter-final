require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  describe 'relationships' do
    it { should have_many(:itinerary_shows) }
    it { should have_many(:shows).through(:itinerary_shows) }
    it { should have_many(:user_itineraries) }
    it { should have_many(:users).through(:user_itineraries) }
    it { should validate_presence_of(:title) }
  end
end