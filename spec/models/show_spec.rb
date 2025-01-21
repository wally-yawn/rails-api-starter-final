require 'rails_helper'

RSpec.describe Show, type: :model do
  describe 'relationships' do
    it { should have_many(:itineraries).through(:itinerary_shows)}
    it { should have_many(:itinerary_shows).dependent(:destroy) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:time) }
  end
end