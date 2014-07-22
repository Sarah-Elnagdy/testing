require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryGirl.create(:user) }
  before do
   @post = user.posts.build(content: "loem iosum", title: "abcd")
  end
  subject { @post }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  it "'s user should = user" do
  	expect(@post.user).to eq(user)
  end
  it { should be_valid }

  describe "when user_id is not present" do
   before { @post.user_id = nil }
   it { should_not be_valid }
   end
   
   describe "when user_id is not present" do
     before {@post.user_id = nil }
     it { should_not be_valid }
   end
   describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
   end

     describe "with blank title" do
    before { @post.title = " " }
    it { should_not be_valid }
   end
   describe "with title that is too long" do
     before { @post.title = "a" * 21 }
     it { should_not be_valid }
   end
  
end
