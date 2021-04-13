class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.integer :subscriber_id, null: false
      t.timestamps
    end
  end
end
