require 'spec_helper'

feature 'User management' do
    background do
	  @admin = FactoryGirl.create(:admin)
	  @attr = {
      :email => "newuser@example.com",
      :password => "changeme",
      :password_confirmation => "changeme",
      :id => User.count+1
    }
	
	  visit root_path
	  expect{
	    click_link 'Sign up'
	    fill_in 'Email', with: @attr[:email]
	    fill_in 'Password', with: @attr[:password]
	    fill_in 'Password confirmation', with: @attr[:password_confirmation]
	    click_button 'Sign up'
	  }.to change(User, :count).by(1)
	  expect(current_path).to eq root_path
	  expect(page).to have_content 'Welcome! You have signed up successfully'
	end

	
	scenario "updates a new user to Admin" do
	sign_in @admin
	visit root_path
	click_link 'Users'
	save_and_open_page
	expect{
	  click_link 'Users'
	  #save_and_open_page
	}.to have_content "#{@attr[:email]}"
	expect{
	  click_link find(:css, "role-options-#{@attr[:id]}")
	}
  end
end