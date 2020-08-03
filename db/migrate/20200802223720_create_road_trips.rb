class CreateRoadTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :road_trips do |t|
      t.references :user, foreign_key: true
      t.string :origin
      t.string :destination
      t.string :duration
      t.string :forecast

      t.timestamps
    end
  end
end
