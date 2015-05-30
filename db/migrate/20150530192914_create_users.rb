class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :surname
      t.string :email
      t.string :phone
      t.text :address
      t.references :organization, index: true
      t.text :tags

      t.timestamps
    end
  end
end
