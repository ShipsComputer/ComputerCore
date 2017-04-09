class CreateEnvironmentalReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :environmental_readings do |t|
      t.float :reading
      t.references :environmental_reading_type, foreign_key: true, on_delete: :cascade
      t.references :sensor_array, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
