class DropTypeFromScores < ActiveRecord::Migration
  def change
  	remove_column :scores, :type
  end
end
