require 'spec_helper'

feature "view items layout" do 

	background do
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

				context "in inspection" do
					background do
						@inspection = FactoryGirl.create(:inspection, site_id: @site.id, user_id: @VIP.id)
					end

					context "for a survey" do
						background do
              @survey = FactoryGirl.create(:survey, name: "#{SURVEY_OPTION[0]}", user_id: @VIP.id, site_id: @site.id, inspection_id: @inspection.id)
						end

						context "with three items" do
							background do
								@item_1 = FactoryGirl.create(:item, survey_id: 100)
								@item_2 = FactoryGirl.create(:item, survey_id: @survey.id)
								@item_3 = FactoryGirl.create(:item, survey_id: @survey.id)
							end
						
							scenario "views items grouped by sub_category" do

								visit root_path
								click_link 'Login'
								fill_in 'Email', with: @VIP.email
								fill_in 'Password', with:@VIP.password
								click_button 'Log in'
								click_link 'Sites'
								click_link "#{@site.name}"
								click_link "#{@inspection.name}"
								save_and_open_page
								page.should have_content("#{@item_2.name}")
								page.should have_content("#{@item_3.name}")
								page.should have_no_content("#{@item_1.name}")
								
							end
					end
				end
			end
		end
	end
end