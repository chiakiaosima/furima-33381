class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :description
      t.integer :category_id
      t.integer :status_id
      t.integer :subscriber_id
      t.integer :region_id
      t.integer :lead_time_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
