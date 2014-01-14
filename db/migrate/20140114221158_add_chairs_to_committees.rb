class AddChairsToCommittees < ActiveRecord::Migration
  def change
    add_column :committees, :chairs, :string
  end
end
