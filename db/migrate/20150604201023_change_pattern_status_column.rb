class ChangePatternStatusColumn < ActiveRecord::Migration
  def change
    rename_column :patterns, :type, :status
  end
end
