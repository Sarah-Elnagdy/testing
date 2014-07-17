require 'rails_helper'

RSpec.describe "AuthenticationPages", :type => :request do
  describe "GET /authentication_pages" do
  	describe "signin page" do
  		before { visit signin_path }
  		it { should have_selector('h1', text: 'Sign in') }
  		it "should have correct title" do
  		expect(page).to have_title('Sign in')
  	end
  	end
  
end
