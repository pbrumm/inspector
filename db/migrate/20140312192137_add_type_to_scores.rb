class AddTypeToScores < ActiveRecord::Migration
  def change
  	add_column :scores, :type, :string
  	add_column :scores, :date, :date
  	add_column :scores, :time, :time
  	add_column :scores, :cashier, :string
  	add_column :scores, :reg, :string
  	add_column :scores, :problem, :text
  	add_column :scores, :amount, :string
  end
end
