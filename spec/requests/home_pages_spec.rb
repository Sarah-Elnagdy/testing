require 'rails_helper'

RSpec.describe "Home Pages", :type => :request do
  describe "Home Page" do
  	it "should have content 'Demo App'" do

   visit'/home_page/home'
   page.should have_content('Our Demo App')

  	end

  		it "should have title 'Demo App | Home'" do

   visit'/home_page/home'
   expect(page).to have_title('Demo App | Home')

  	end

  	 it "should have title 'Demo App | About Us'" do

   visit'/home_page/about'
   expect(page).to have_title('Demo App | About Us')

  	end
  		it "should have content 'About Us'" do

   visit'/home_page/about'
   page.should have_content('About Us')

  	end
  		it "should have content 'Location'" do

   visit'/home_page/location'
   page.should have_content('Location')

  	end
  		it "should have title 'Demo App | Location'" do

   visit'/home_page/location'
   expect(page).to have_title('Demo App | Location')

  	end
  		it "should have title 'Demo App | Contact Us'" do

   visit'/home_page/contact'
   expect(page).to have_title('Demo App | Contact Us')

  	end
  		it "should have content 'Contact'" do

   visit'/home_page/contact'
   page.should have_content('Contact Us')

  	end
  end

end
