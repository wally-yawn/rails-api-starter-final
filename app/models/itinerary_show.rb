class ItineraryShow < ApplicationRecord
  has_many :itineraries
  has_many :shows
end