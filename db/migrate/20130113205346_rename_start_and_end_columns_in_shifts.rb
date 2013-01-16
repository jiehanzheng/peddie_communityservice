class RenameStartAndEndColumnsInShifts < ActiveRecord::Migration
  def change
    rename_column :shifts, :start, :start_time
    rename_column :shifts, :end, :end_time
  end
end
