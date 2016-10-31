class CreateSensorArrays < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_arrays do |t|
      t.string :name
      t.belongs_to :craft, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
