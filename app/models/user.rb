class User < ApplicationRecord
  has_many :user_itineraries
  has_many :itineraries, through: :user_itineraries
  validates :first_name, :last_name, :email, presence: true
end