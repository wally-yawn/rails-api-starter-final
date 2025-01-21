class CreateItineraryShows < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_shows do |t|
      t.references :itinerary, null: false, foreign_key: true, type: :bigint
      t.references :show, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
