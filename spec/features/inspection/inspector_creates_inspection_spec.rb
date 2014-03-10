require 'spec_helper'

  feature "inspector creates inspection" do 

    background do
     @attr = {
        :name => "LP test",
        :site_id => 3
      }
      @survey_option = ["Loss Prevention", "Store Safety", "DEC Review"]
    end

    context "for a site" do
      
      background do
        @site = FactoryGirl.create(:site)
      end

      context "as VIP" do
        background do
          @vip = FactoryGirl.create(:VIP)
        end

      scenario "can create a new inspection" do
        visit root_path
        expect{
          click_link 'Login'
          fill_in 'Email', with: @vip.email
          fill_in  'Password', with: @vip.password
          click_button 'Log in'
          click_link 'Sites'
          click_link "#{@site.name}"
         click_link "New Inspection"
          page.should have_content("#{@site.name}")
          select("#{@survey_option[0]}")
#save_and_open_page
          click_button 'Start inspection'
        }.to change(Inspection, :count).by(1)
      end
    end
    end
  end