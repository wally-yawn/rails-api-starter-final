class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.string :img_url, null: false
      t.timestamps
    end
  end
end
