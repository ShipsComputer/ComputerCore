class CreateEnvironmentalReadingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :environmental_reading_types do |t|
      t.string :handle

      t.timestamps
    end
  end
end
