class AddDefaultValueForNumSignupsInShifts < ActiveRecord::Migration
  def change
    change_column_default :shifts, :num_signups, 0
  end
end
