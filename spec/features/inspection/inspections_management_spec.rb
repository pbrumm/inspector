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
          SURVEY_OPTION = ["LP test Test", "number 2"]
          @survey = FactoryGirl.create(:survey, name: "#{SURVEY_OPTION[0]}", user_id: @vip.id)
        end

        context "survey exists" do
        

          scenario "can create a new inspection for a site" do
            visit root_path
            
            click_link 'Login'
            fill_in 'Email', with: @vip.email
            fill_in  'Password', with: @vip.password
            click_button 'Log in'
            click_link 'Sites'
            click_link "#{@site.name}"
            save_and_open_page
            click_link "New Inspection"
            
            page.should have_content("@survey.name}")

          end
        end

      scenario "can view a list of inspections for a site" do

        
      end

      scenario "can edit an inspection for a site" do
      end
    end


    end
    
  end