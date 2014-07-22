require 'rails_helper'

RSpec.describe "PostPages", :type => :request do
  describe "GET /post_pages" do
  subject { page }
  let!(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  describe "post creation" do
    before { visit root_path }

    describe " with valid info" do
     
     it " should creat a post" do
        expect { click_button "Post"}.not_to change(Post, :count)
     end
     describe "error messages" do
       before { click_button "Post" }
       it { should have_content('error') }
     end
    end
  end
describe "micropost destruction" do
 before { FactoryGirl.create(:post, user: user) }
 describe "as correct user" do
  before { visit root_path }
  it " should delete a micropost" do
  	expect { click_link "delete" }.to change(Post, :count).by(-1)

  end
end
end
  end
end
