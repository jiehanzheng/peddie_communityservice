class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.integer :user_id
      t.integer :shift_id

      t.timestamps
    end
  end
end
