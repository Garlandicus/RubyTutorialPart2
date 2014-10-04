namespace :db do
	desc "Fill database with sample data" 
	task populate: :environment do
		User.create!(name: "Zidane Tribal",
					 email: "2daggers2good@gaia.org",
					 password: "garnet",
					 password_confirmation: "garnet",
					 admin: true)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@gaia.org"
			password = "password"
			User.create!(name: name,
						 email: email,
						 password: password,
						 password_confirmation: password)
		end
	end
end