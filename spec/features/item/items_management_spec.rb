require 'spec_helper'

  feature "create items" do 

    background do
      @attr = {
        :name => "Cashiers are physically counting?",
        :category => "Cash",
        :sub_category => "Video Review",
        :explanation => "Floors and aisles are clear",
        :scoring => 7,
        :high_score => 10,
        :all_or_nothing => true
      }

      SURVEY_OPTION = ["LP test Test", "number 2"]
    end
    context "as a VIP" do
      background do
        @VIP = FactoryGirl.create(:VIP)
      end     

      context "for a site" do
        background do
          @site = FactoryGirl.create(:site)
        end

        context "in inspections" do
          background do
            @inspection = FactoryGirl.create(:inspection, site_id: @site.id, user_id: @VIP.id)
          end


          context "for a survey" do
            background do
              @survey = FactoryGirl.create(:survey, name: "#{SURVEY_OPTION[0]}", user_id: @VIP.id, site_id: @site.id, inspection_id: @inspection.id)
            end

            scenario "can create an item" do
              visit root_path
              expect{
                click_link 'Login'
                fill_in 'Email', with: @VIP.email
                fill_in 'Password', with: @VIP.password
                click_button 'Log in'
                click_link 'Sites'
                click_link "#{@site.name}"
                click_link 'New Inspection'
                page.should have_content("#{@site.name}")
                select "#{@survey.name}"
                click_link 'Surveys'
                click_link "#{@survey.name}"
                click_link "New Item"
                fill_in 'Category', with: @attr[:category]
                fill_in 'Sub category', with: @attr[:sub_category]
                fill_in 'Name', with: @attr[:name]
                fill_in 'Explanation', with: @attr[:explanation]
                fill_in 'Scoring', with: @attr[:scoring]
                fill_in 'High score', with: @attr[:high_score]
                save_and_open_page
                check 'All or nothing', :checked
                click_button 'Create item'
              }.to change(Item, :count).by(1)
            end

            scenario "can view a list of items for an inspection" do

            end

            scenario "can edit an item" do
              
            end
          end
        end
      end

    end
    
  end