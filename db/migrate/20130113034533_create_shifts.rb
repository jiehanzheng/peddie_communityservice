class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.integer :committee_id
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
