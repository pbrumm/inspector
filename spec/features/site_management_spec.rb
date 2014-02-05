require 'spec_helper'
 
  feature 'site management' do

    background do
      @user = FactoryGirl.create(:user, email: "u2@example.com")
      @admin = FactoryGirl.create(:admin)
      @site = FactoryGirl.create(:site)
      @user.site_id = @site.id
      @attr = {
        :name => "My Stores",
        :site_type => "Store",
        :site_number => 3
      }
    end

    scenario "shows a list of sites" do
      visit root_path
      expect(page).to have_content "#{@site.name}"
    end

    context "administrator" do

      scenario "is able to create a site" do
        visit root_path
        expect{
          click_link 'Login'
          fill_in 'Email', with: @admin.email
          fill_in 'Password', with: @admin.password
          click_button 'Log in'
          click_link 'Sites'
          click_link "New Site"
          save_and_open_page
          fill_in 'Name', with: @attr[:name]
          fill_in 'Site number', with: @attr[:site_number]
          fill_in 'Site type', with: @attr[:site_type]
          click_button 'Create Site'
        }.to change(Site, :count).by(1)
      end

      scenario "is able to edit a site" do

      end

      scenario "is able to delete a site" do

      end

      scenario "is able to assign a user to a site" do
      end

    end  

      scenario "will not allow a user to see other sites" do

      end
    
     
   end