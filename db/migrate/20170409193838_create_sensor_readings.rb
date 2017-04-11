class CreateSensorReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_readings do |t|
      t.float :reading
      t.references :sensor_type, foreign_key: true, on_delete: :cascade
      t.references :sensor_array, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
