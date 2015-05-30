class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.text :criteria
      t.text :description
      t.text :tags

      t.timestamps
    end
  end
end
