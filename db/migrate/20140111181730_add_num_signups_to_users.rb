class AddNumSignupsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :num_signups, :integer, {:default => 0}
  end
end
