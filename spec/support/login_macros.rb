module LoginMacros
  def set_user_session(user)
  	session[:user_id] = user.id
  end

  def sign_in(user)
  	visit root_path
  	click_link 'login'
  	fill_in 'Email', with: user.email
  	fill_in 'Password', with: user.Password
  	click_button "Log in"
  end
end