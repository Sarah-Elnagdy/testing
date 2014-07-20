require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do

	subject { page }
  describe "GET /authentication_pages" do

  	describe "signin page" do
  		before { visit root_path }
  	end
  
  describe "sign in" do
     before { visit root_path }
    describe "with valid info" do
    		before { click_button "Sign in"}
    		
  			it { should have_selector('div.alert.alert-danger', text: 'Invalid') }

   			describe "after visiting anothe page" do
	  			 before { click_link "About Us" }
	  			it { should_not have_selector('div.alert.alert-danger') }
   			end
    end
    describe "with invalid info" do


    end

        describe "with valid info" do

         let(:user) { FactoryGirl.create(:user) }
         before do
         	fill_in "Email", with: user.email
         	fill_in "Password", with: user.password
         	click_button "Sign in"
        end
        it "should have  title" do
      expect(page).to have_title(user.name)
    end
    it { should have_link('Profile', href: user_path(user)) }
    it { should have_link('Sign out', href: signout_path) }
    it { should_not have_link('Sign in', href: signin_path) }

    describe "follow by signout" do
    	before { click_link "Sign out" }
    	it {should have_css("form.signin")}

    end

end


 
  end
  end
end
