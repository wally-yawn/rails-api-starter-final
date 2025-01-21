class Show < ApplicationRecord
  has_many :itinerary_shows, dependent: :destroy
  has_many :itineraries, through: :itinerary_shows
  validates :name, :date, :time, presence: true
end