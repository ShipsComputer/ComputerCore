class CreateWeatherReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_readings do |t|
      t.float :temp
      t.float :humidity
      t.float :pressure
      t.belongs_to :sensor_array, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
