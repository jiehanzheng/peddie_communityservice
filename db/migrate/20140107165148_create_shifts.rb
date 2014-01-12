class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :committee_id
      t.integer :position
      t.integer :capacity
      t.integer :num_signups
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
