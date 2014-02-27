require 'spec_helper'

feature "scores for inspection total up" do 

	background do
		SURVEY_OPTIONS = ["LP test Test", "number 2"]
		@vip = FactoryGirl.create(:VIP)
		@site = FactoryGirl.create(:site)
		@survey = FactoryGirl.create(:survey, name: "#{SURVEY_OPTIONS[0]}", user_id: @vip.id, site_id: @site.id)
		@inspection = FactoryGirl.create(:inspection, site_id: @site.id, user_id: @vip.id, survey_id: @survey.id)
		@item_1 = FactoryGirl.create(:item, survey_id: 100)
		@item_2 = FactoryGirl.create(:item, survey_id: @survey.id)
		@item_3 = FactoryGirl.create(:item, survey_id: @survey.id)
	end

	scenario "VIP user enters score for item" do
		visit root_path
		expect{
			click_link 'Login'
			fill_in 'Email', with: @vip.email
			fill_in 'Password', with: @vip.password
			click_button 'Log in'
			click_link 'Sites'
			click_link "#{@site.name}"
			click_link "#{@survey.name}"

			page.should have_content("#{@item_2.sub_category}")
			page.should have_content("#{@item_2.name}")
			page.should have_content("#{@item_3.name}")
			save_and_open_page
			page.find(:css, ".item_hiscore"+".item-#{@item_2.id}"+".small-6"+".columns", :visible => true).text == ("/ " + "#{@item_2.high_score}")
			#page.find(:xpath, //div[contains(@class, "item-#{@item_2.id}")]).text == ("/ " + "#{@item_2.high_score}")
			#page.find(".item_hiscore " + "item-#{@item_2.id}" + " small-6 columns").text ==  ("/ " + "#{@item_2.high_score}")
			#page.should have_css("item_hiscore " + "item-#{@item_2.id}" + " small-6 columns", text: "/ " + "#{@item_2.high_score}")
			#find(:css, "class=item_hiscore " + "item-#{@item_2.id}").text.should == "
			find(:css, "input[id$= 'inspection_scores_score_item']").set(8)
			#fill_in find(:css, ".item_score" + ".item-#{@item_2.id}"+".small-6"+".columns"), with: 8
			click_button 'Create inspection'
		}.to change(Score, :count).by(1)
	end
	
end