class AddTypeAndNumberToSites < ActiveRecord::Migration
  def change
    add_column :sites, :type, :string
    add_column :sites, :number, :integer
  end
end
