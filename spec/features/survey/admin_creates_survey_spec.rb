require 'spec_helper'

  feature "Survey creation" do 

    background do
      @attr = {
        :name => "LP test",
        :active => true
      }
      @survey_names = ["#{@attr[:name]}", "number 2"]
      SURVEY_OPTIONS = ["#{@attr[:name]}", "number 2"]
    end

    context "as an admin" do
      background do
        @admin = FactoryGirl.create(:admin)
      end

      scenario "can create a new survey" do
        visit root_path
        expect{
          click_link 'Login'
          fill_in 'Email', with: @admin.email
          fill_in 'Password', with: @admin.password
          click_button 'Log in'
          click_link 'Surveys'
          click_link 'New Survey'
          save_and_open_page
          select("#{@attr[:name]}") 
          click_button 'Create survey'
        }.to change(Survey,:count).by(1)
        page.should have_content("#{@attr[:name]}")
      end

    end
    
  end