require 'rails_helper'

RSpec.describe "Blogs", :type => :request do
 


  describe "GET 'home'" do
    it "should have the base title" do
      visit root_path
      save_and_open_page
      expect(page).to have_title('Demo |  ')
    end

      it "should have the h1 'Demo Blog'" do
      visit root_path
      page.should have_selector('h1', text: 'Hello, world!')
    end



     it "should have link 'Demo Blog'" do
      visit root_path
      page.should have_link('Demo Blog', :href => root_path(@Blogs))

    end

    it "should have link 'About Us'" do
      visit root_path
      page.should have_link('About Us', :href => about_path(@Blogs))

    end

     it "should have link 'Sign up'" do
      visit root_path
      page.should have_link('Sign up', :href => signup_path(@Users))

    end


 

  end

   describe "GET 'about'" do
    it "should have the base title" do
      visit about_path
      expect(page).to have_title('Demo | About Us')
     
    end


  end


end
