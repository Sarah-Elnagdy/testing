require 'rails_helper'

RSpec.describe "Blogs", :type => :request do
 


  describe "GET 'home'" do
    it "should have the base title" do
      visit root_path
      expect(page).to have_title('Demo |  ')
    end

    
      describe "for signed in users" do
         let(:user) { FactoryGirl.create(:user) }
         before do
          FactoryGirl.create(:post, user: user, content: "Lorem ipsm")
          FactoryGirl.create(:post, user: user, content: "Dolor sit amet")
          sign_in user
          visit root_path
       end
       it "should render the user's feed" do
        user.feed.each do |item|
         page.should have_selector("li##{item.id}", text: item.content)
        end
       end
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


     it "should have link 'Sign in'" do
      visit root_path
      #page.should have_link('Sign in')
      page.should have_css("form.signin")
    end


 

  end

   describe "GET 'about'" do
    it "should have the base title" do
      visit about_path
      expect(page).to have_title('Demo | About Us')
     
    end


  end


end
