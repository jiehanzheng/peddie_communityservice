class AddSiteRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :site_role, :string
  end
end
