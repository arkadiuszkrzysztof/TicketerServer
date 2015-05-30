class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :fullName
      t.text :address
      t.string :phone
      t.string :email
      t.text :description
      t.integer :capacity
      t.text :tags

      t.timestamps
    end
  end
end
