# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
      content "Lorem ipsum"
      title "something"
      user
	end
end
