class CreateLeadTimes < ActiveRecord::Migration[6.0]
  def change
    create_table :lead_times do |t|
      t.integer :lead_time_id, null: false
      t.timestamps
    end
  end
end
