class CreateVesselCoordinates < ActiveRecord::Migration[5.0]
  def change
    create_table :vessel_coordinates do |t|
      t.belongs_to :sensor_array, foreign_key: true
      t.geography :point, limit: {:srid=>4326, :type=>"point", :geographic=>true}
      t.float :point_accuracy
      t.float :heading
      t.float :speed
      t.float :altitude
      t.float :altitude_accuracy
      t.datetime :timestamp

      t.timestamps
    end
  end
end
