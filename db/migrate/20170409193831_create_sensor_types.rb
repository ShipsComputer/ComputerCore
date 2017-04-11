class CreateSensorTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :sensor_types do |t|
      t.string :handle

      t.timestamps
    end
  end
end
