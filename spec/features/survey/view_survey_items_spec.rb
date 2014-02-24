require 'spec_helper'

feature "view all items" do
	
	background do
		SURVEY_OPTIONS = ["LP test Test", "number 2"]
		@vip = FactoryGirl.create(:VIP)
		@survey1 = FactoryGirl.create(:survey, user_id: @vip.id, name: SURVEY_OPTIONS[0])
		survey2 = FactoryGirl.create(:survey, user_id: @vip.id, name: SURVEY_OPTIONS[1])
		@item1 = FactoryGirl.create(:item, category: "strange", sub_category: "one", survey_id: @survey1.id)
		@item2 = FactoryGirl.create(:item, category: "sordid", sub_category: "one", survey_id: survey2.id)
		@item3 = FactoryGirl.create(:item, category: "sordid", sub_category: "two", survey_id: @survey1.id)
		@item4 = FactoryGirl.create(:item, category: "strange", sub_category: "two", survey_id: survey2.id)
		@item5 = FactoryGirl.create(:item, category: "strange", sub_category: "three", survey_id: @survey1.id)

	end


		
	scenario "VIP user sees all items for all surveys" do 
		visit root_path
		click_link 'Login'
		fill_in 'Email', with: @vip.email
		fill_in 'Password', with: @vip.password
		click_button 'Log in'
		click_link 'Surveys'
		click_link 'View all items'
		page.should have_content("#{@item1.name}")
		page.should have_content("#{@item3.name}")
		page.should have_content("#{@item2.name}")
	end


end