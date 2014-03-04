require 'spec_helper'

feature "scores for inspection total up" do 

	background do
		SURVEY_OPTIONS = ["LP test Test", "number 2"]
		MY_NUMBER = 8
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
		click_link 'Login'
		fill_in 'Email', with: @vip.email
		fill_in 'Password', with: @vip.password
		click_button 'Log in'
		click_link 'Sites'
		click_link "#{@site.name}"
		click_link 'New Inspection'
		select("#{@survey.name}")
		click_button 'Start inspection'

		page.should have_content("#{@item_2.sub_category}")
		page.should have_content("#{@item_2.name}")
		page.should have_content("#{@item_3.name}")
		page.find(:css, ".item_hiscore"+".item-#{@item_2.id}"+".small-6"+".columns", :visible => true).text == ("/ " + "#{@item_2.high_score}")
		#page.find(:xpath, //div[contains(@class, "item-#{@item_2.id}")]).text == ("/ " + "#{@item_2.high_score}")
		#page.find(".item_hiscore " + "item-#{@item_2.id}" + " small-6 columns").text ==  ("/ " + "#{@item_2.high_score}")
		#page.should have_css("item_hiscore " + "item-#{@item_2.id}" + " small-6 columns", text: "/ " + "#{@item_2.high_score}")
		#find(:css, "class=item_hiscore " + "item-#{@item_2.id}").text.should == "
		#find(:css, "input[id$= 'inspection_scores_score_item']").set(8)
		#fill_in find(:css, ".item_score" + ".item-#{@item_2.id}"+".small-6"+".columns"), with: 8
		within(:css, ".item_score" + ".item-#{@item_2.id}"+".small-6"+".columns") do 				
		  fill_in 'survey_scores_score_item', with: MY_NUMBER
		end

		click_button 'Edit inspection'
			#binding.pry
		expect(Score.where(item_id: @item_2.id, inspection_id: @inspection.id)).to exist

	end
	
end