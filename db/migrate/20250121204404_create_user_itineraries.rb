class CreateUserItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :user_itineraries do |t|
      t.references :user, null: false, foreign_key: true, type: :bigint
      t.references :user_itineraries, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
