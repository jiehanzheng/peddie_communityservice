class AddCapacityToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :capacity, :integer
  end
end
