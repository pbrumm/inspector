require 'spec_helper'
 
  feature 'site management' do

    background do
      site = create(:site)
    end

    scenario "shows a list of sites" do
      visit root_path
      expect(page).to have content "#{site.name}"
    end

    context "administrator" do

      scenario "is able to create a site" do

      end

      scenario "is able to edit a site" do

      end

      scenario "is able to delete a site" do

      end

    end  

      scenario "will not allow a user to see other sites" do

      end
    
     
   end