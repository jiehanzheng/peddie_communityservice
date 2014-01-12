class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
