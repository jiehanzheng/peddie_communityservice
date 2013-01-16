class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
