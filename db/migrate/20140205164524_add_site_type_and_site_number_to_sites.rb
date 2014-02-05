class AddSiteTypeAndSiteNumberToSites < ActiveRecord::Migration
  def change
    add_column :sites, :site_type, :string
    add_column :sites, :site_number, :integer
  end
end
