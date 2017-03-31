class AddHandles < ActiveRecord::Migration[5.0]
  def change
    add_column :crafts, :handle, :string
    add_column :sensor_arrays, :handle, :string
  end
end
