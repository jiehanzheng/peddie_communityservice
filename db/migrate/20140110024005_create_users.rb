class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true, name: :users_omniauth_lookup
  end
end
