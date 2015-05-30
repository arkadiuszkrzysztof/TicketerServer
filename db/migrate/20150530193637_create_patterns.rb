class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :type
      t.text :description
      t.text :tags

      t.timestamps
    end
  end
end
