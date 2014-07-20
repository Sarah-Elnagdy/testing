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
    		
  			it { save_and_open_page; should have_selector('div.alert.alert-danger', text: 'Invalid') }

   			describe "after visiting anothe page" do
	  			 before { click_link "About Us" }
	  			it { should_not have_selector('div.alert.alert-danger') }
   			end
    end
    describe "with invalid info" do


    end

        describe "with valid info" do

         let(:user) { FactoryGirl.create(:user) }
         before { sign_in user }
 
        it "should have  title" do
      expect(page).to have_title(user.name)
    end
    it { should have_link('Profile', href: user_path(user)) }
    it { should have_link('Sign out', href: signout_path) }
    it { should have_link('Settings', href: edit_user_path(user)) }
    it { should_not have_link('Sign in', href: signin_path) }

    describe "follow by signout" do
    	before { click_link "Sign out" }
    	it { should have_link('Sign in') }

    end

end


 
  end
  end
  describe "authorization" do
    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "when attempting to visit a protected page" do
       before do
        visit edit_user_path(user)
        fill_in "Name", with: user.name
        fill_in "Email", with: user.email
        click_button "Sign in"
       end
       describe "after signing in" do
        it "should render the desired protected page" do
              it "should have  title" do
                 expect(page).to have_title('Edit user')
               end
        end
       end
      end
      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
                 it "should have  title" do
      expect(page).to have_title('Sign in')
    end
    it { should have_selector('div.alert.alert-notice') }

        end
        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path)}

        end

      end
      describe "as wrong user" do
       let(:user) { FactoryGirl.create(:user) }
       let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
       before { sign_in user}
       describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
       it "should have  title" do
         expect(page).to have_title('Edit user')
        end
       end
       describe "submitting a PUT request to the Users#update action" do
          before { put user_path(wrong_user) }
          specify { response.should redirect_to(root_path) }
       end
      end
    end

  end
end
