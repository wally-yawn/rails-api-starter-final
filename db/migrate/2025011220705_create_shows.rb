class CreateShows < ActiveRecord::Migration[7.1]
  def change
    create_table :shows do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.time :time, null: false

      t.timestamps
    end
  end
end
