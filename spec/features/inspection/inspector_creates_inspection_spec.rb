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

        context "survey exists" do 
          background do
            @survey = FactoryGirl.create(:survey, name: SURVEY_OPTIONS[0])
          end

          context "and has items" do
            background do
              @item1 = FactoryGirl.create(:item, category: "strange", sub_category: "one")
              @item2 = FactoryGirl.create(:item, category: "sordid", sub_category: "one")
              @item3 = FactoryGirl.create(:item, category: "sordid", sub_category: "two")
              @item4 = FactoryGirl.create(:item, category: "strange", sub_category: "two")
              @item5 = FactoryGirl.create(:item, category: "strange", sub_category: "three")
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
     # save_and_open_page
                select("#{@survey_option[0]}")
                click_button 'Start inspection'
              }.to change(Inspection, :count).by(1)

              expect(Inspection.first.name).to eq("#{SURVEY_OPTIONS[0]}")
              expect(Score.count).to eq(5)
              expect(page).to have_content("#{@item1.category}")
            end



          end #items
        end #survey
      end #vip
    end #site
  end #feature
