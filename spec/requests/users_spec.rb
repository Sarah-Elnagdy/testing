require 'rails_helper'

RSpec.describe "Users", :type => :request do
 

     describe "GET 'new'" do
    it "should have the base title" do
      visit signup_path
            expect(page).to have_title('Demo | New')

    end
  end
end
