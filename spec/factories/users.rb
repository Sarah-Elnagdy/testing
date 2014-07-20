# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
		sequence(:name) { |n| "Person #{n}"}
		sequence(:email) { |n| "Person_#{n}@example.com"}
		password "password"
		password_confirmation "password"
	end
end