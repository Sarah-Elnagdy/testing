include ApplicationHelper

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: 'Invalid')
	end
end

def sign_in(user)
      visit root_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Sign in"
      # sign in when not using capubara.
      cookies[:remember_token] = user.remember_token

end