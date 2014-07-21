require 'rails_helper'

RSpec.describe User, :type => :model do

before { @user = User.new(name: "Example User", email:"user@example.com", password: "foobar00", password_confirmation: "foobar00")}
subject { @user }
it { should respond_to(:name) }
it { should respond_to(:email) }
it { should respond_to(:password_digest) }
it { should respond_to(:password) }
it { should respond_to(:password_confirmation) }
it { should respond_to(:remember_token) }
it { should respond_to(:admin) }
it { should be_valid }
it { should_not be_admin }


describe "when name is not present" do
	before { @user.name = " "}
	it { should_not be_valid }
end




describe "when email is not present" do

	before { @user.email = " "}
	it { should_not be_valid }
end

describe "when name is too long" do
	before { @user.name = "a" * 41 }
	it { should_not be_valid }
end

describe "when email format is invalid" do
	it"should be invalid" do
		addresses =%w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |invalid_address|
			@user.email = invalid_address
			@user.should_not be_valid
		end
	end
end

describe "when email format is valid" do
	it "should be valid" do
		addresses = %w[user@foo.com A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
addresses.each do |valid_address|
	@user.email = valid_address
			@user.should be_valid
end
end
end

describe "when email address is already taken" do
	before do
		user_with_same_email = @user.dup
		user_with_same_email_email = @user.email.upcase
		user_with_same_email.save
	end
	it { should_not be_valid}
end

describe "when password is not present" do
	before { @user.password = @user.password_confirmation = " "}
	it { should be_invalid}
end
describe "when password doesn't match confirmation" do
	before { @user.password_confirmation = "mismatch"}
	it { should_not be_valid }
end
describe "when password confirmation is nil" do
	before { @user.password_confirmation = nil}
	it { should_not be_valid}
end
describe "when password is too short" do
	before { @user.password = @user.password_confirmation = "a" * 7 }
	it { should_not be_valid }
end
describe "remember token" do
	before { @user.save}
	it "should have a non blank remember token" do
		expect(@user.remember_token).not_to be_blank
	end
end

end
