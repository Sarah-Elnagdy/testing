namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
    admin =  User.create!(name: "Example User",
      	            email: "example@railstutorial.org",
      	            password: "password",
      	            password_confirmation: "password")
    admin.toggle!(:admin) 
      99.times do |n|
      	name = Faker::Name.name
      	email = "example-#{n+1}@railstutorial.org"
      	password = "password"
      	User.create!(name: name, email: email, password: password, password_confirmation: password)
      end
        users = User.limit(6)

        50.times do
          content = Faker::Lorem.sentence(5)
          title = Faker::Lorem.word
          users.each { |user| user.posts.create!(content: content, title: title) }
      end
  end
end
