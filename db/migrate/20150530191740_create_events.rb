class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :fullName
      t.references :owner
      t.references :location
      t.datetime :startDate
      t.datetime :endDate
      t.text :description
      t.text :tags

      t.timestamps
    end
  end
end
