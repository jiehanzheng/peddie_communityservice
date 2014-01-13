class AddUniqueIndexToSignups < ActiveRecord::Migration
  def change
    add_index :signups, [:user_id, :shift_id], unique: true
  end
end
