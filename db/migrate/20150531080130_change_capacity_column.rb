class ChangeCapacityColumn < ActiveRecord::Migration
  def change
    change_column :locations, :capacity, :string
  end
end
