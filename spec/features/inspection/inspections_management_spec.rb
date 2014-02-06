require 'spec_helper'

  feature "inspection management" do 

    background do
     @attr = {
        :name => "LP test",
        :site_id => 3
      }
    end

    context "for a site" do
      
      background do
        @site = FactoryGirl.create(:site)
        #@user.site_id = @site.id
      end

      context "as VIP" do
        background do
          @vip = FactoryGirl.create(:VIP)
          @form = FactoryGirl.create(:inspection, name: @attr[:name])
        end

      scenario "can create a new inspection for a site" do
        visit root_path
        expect{
          click_link 'Login'
          fill_in 'Email', with: @vip.email
          fill_in  'Password', with: @vip.password
          click_button 'Log in'
          click_link 'Sites'
          click_link "#{@site.name}"
          save_and_open_page
          click_link "#{@attr[:name]}"
        }.to change(Inspection, :count).by(1)

      end

      scenario "can view a list of inspections for a site" do

        
      end

      scenario "can edit an inspection for a site" do
      end
    end


    end
    
  end