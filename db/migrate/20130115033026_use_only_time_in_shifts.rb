class UseOnlyTimeInShifts < ActiveRecord::Migration
  def change
    remove_column :shifts, :start_time
    remove_column :shifts, :end_time

    add_column :shifts, :start_time, :time
    add_column :shifts, :end_time, :time
  end
end
