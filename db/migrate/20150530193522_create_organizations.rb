class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :fullName
      t.text :address
      t.string :phone
      t.string :email
      t.text :tags

      t.timestamps
    end
  end
end
