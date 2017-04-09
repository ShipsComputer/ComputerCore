class DropWeatherReadingTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :weather_readings do |t|
      t.float :temp
      t.float :humidity
      t.float :pressure
      t.belongs_to :sensor_array, foreign_key: true

      t.timestamps
    end
  end
end
