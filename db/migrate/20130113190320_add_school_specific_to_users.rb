class AddSchoolSpecificToUsers < ActiveRecord::Migration
  def change
    add_column :users, :school_role, :string
    add_column :users, :graduation_year, :string
  end
end
