class CreateCrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :crafts do |t|
      t.string :name

      t.timestamps
    end
  end
end
