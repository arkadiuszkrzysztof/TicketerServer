class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :startDate
      t.datetime :endDate
      t.string :mask
      t.text :tags

      t.timestamps
    end
  end
end
