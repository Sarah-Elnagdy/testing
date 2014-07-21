require 'rails_helper'

RSpec.describe Post, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryGirl.create(:user) }
  before do
   @post = Post.new(content: "loem iosum", user_id: user.id)
  end
  subject { @post }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe "when user_id is not present" do
   before { @post.user_id = nil }
   it { should_not be_valid }
  end
end
