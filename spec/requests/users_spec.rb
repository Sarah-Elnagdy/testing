require 'rails_helper'

RSpec.describe "Users", :type => :request do
 
	subject{page}
     describe "GET 'new'" do
    it "should have the base title" do
      visit signup_path
            expect(page).to have_title('Demo | Sign up')

    end
  end

  describe "profile page" do
  	let(:user) { FactoryGirl.create(:user) }



  	before { visit user_path(user.id) }
  	it { should have_selector('h1', text: user.name) }
  	it "should have correct title" do
  		expect(page).to have_title(user.name)
  	end
  	
end

describe "signup" do
	before {visit signup_path}
	let(:submit) { "Create my account" }

	describe "with invalid info" do
		it "should not creat a user" do
			expect { click_button submit }.not_to change(User, :count)
		

		end
	end
	describe "with valid info" do
		before do
			within("form#new_user") do
				fill_in "Name", with: "Example User"
				fill_in "Email", with: "user@example.com"
				fill_in "Password", with: "sasasasa"
				fill_in "Confirmation", with: "sasasasa"
			end
		end

		it " should create a user" do
			expect { click_button submit }.to change(User, :count).by(1)
				

		end
		describe "after saving a user" do
			before { click_button submit }
			let(:user) {User.find_by_email("user@example.com") }
			it "should have after title" do
				  		expect(page).to have_title(user.name)

end
end

	end

	end
end