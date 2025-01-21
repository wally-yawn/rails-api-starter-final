class Itinerary < ApplicationRecord
  has_many :itinerary_shows
  has_many :user_itineraries
  has_many :shows, through: :itinerary_shows
  has_many :users, through: :user_itineraries
  validates :title, presence: true
end