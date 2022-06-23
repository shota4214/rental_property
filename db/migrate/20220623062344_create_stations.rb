class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.string :route_name
      t.string :station_name
      t.integer :minutes_on_foot
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
