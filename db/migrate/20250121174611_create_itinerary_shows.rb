class CreateItineraryShows < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_shows do |t|
      t.references :itineraries, null: false, foreign_key: true, type: :bigint
      t.references :shows, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
