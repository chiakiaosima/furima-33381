class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.integer :region_id, null: false
      t.timestamps
    end
  end
end
