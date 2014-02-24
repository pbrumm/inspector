require 'spec_helper'

feature "create items for specific layout" do
	
	background do
		SURVEY_OPTIONS = ["LP test Test", "number 2"]
		@attr = {
			:category => "General",
			:name => "Return cash to customer",
			:sub_category => "subby",
			:explanation => "string exp",
			:scoring => 2,
			:high_score => 3,
			:all_or_nothing => :unchecked
		}
	end

	  context "as a VIP" do 
	  	background do
	  		@vip = FactoryGirl.create(:VIP)
	  	end

	  	context "for a specific survey" do
	  		background do
	  			@survey = FactoryGirl.create(:survey, user_id: @vip.id, name: SURVEY_OPTIONS[0])
	  		end

	  		scenario "make a new item" do
	  			expect{
	  				visit root_path
	  				 click_link 'Login'
	  				 fill_in 'Email', with: @vip.email
	  				 fill_in 'Password', with: @vip.password
	  				 click_button 'Log in'
	  				 click_link 'Surveys'
	  				 click_link "#{@survey.name}"
	  				 page.should have_content("#{@survey.name}")
	  				 click_link 'New Item'
	  				 page.should have_content("New Item for #{@survey.name}")
	  				 fill_in 'Category', with: @attr[:category]
	  				 fill_in 'Name', with: @attr[:name]
	  				 fill_in 'Sub category', with: @attr[:sub_category]
	  				 fill_in 'Explanation', with: @attr[:explanation]
	  				 fill_in 'Scoring', with: @attr[:scoring]
	  				 fill_in 'High score', with: @attr[:high_score]
	  				 uncheck 'All or nothing'
	  				 click_button 'Create item'
	  			}.to change(Item, :count).by(1)
	  			page.should have_content("#{@attr[:name]}")
	  			click_link "New Item"
	  			page.should have_content("#{@survey.name}")
	  		end

	  	
	  		
	  	end
	  	
	  end

end