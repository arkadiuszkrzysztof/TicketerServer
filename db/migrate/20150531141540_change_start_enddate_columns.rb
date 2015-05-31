class ChangeStartEnddateColumns < ActiveRecord::Migration
  def change
    change_column :events, :startDate, :date
    change_column :events, :endDate, :date
  end
end
