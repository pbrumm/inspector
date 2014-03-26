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
              @item1 = FactoryGirl.create(:item, category: "strange", sub_category: "one", survey_id: @survey.id)
              @item2 = FactoryGirl.create(:item, category: "sordid", sub_category: "one", survey_id: @survey.id)
              @item3 = FactoryGirl.create(:item, category: "sordid", sub_category: "two", survey_id: @survey.id)
              @item4 = FactoryGirl.create(:item, category: "strange", sub_category: "two", survey_id: @survey.id)
              @item5 = FactoryGirl.create(:item, category: "strange", sub_category: "three", survey_id: @survey.id)
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
              expect(page).to have_content("#{@item1.sub_category}")
              expect(page).to have_content("#{[@item1, @item2, @item3, @item4, @item5].inject(0) {|sum, hash| sum + hash[:high_score]}}")
              
            end



          end #items
        end #survey
      end #vip
    end #site
  end #feature
