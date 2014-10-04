FactoryGirl.define do 
	factory :user do
		sequence(:name) { |n| "Clone No.#{n}"}
		sequence(:email){ |n| "c_#{n}@kamino.gov"}
		password 				"foobar"
		password_confirmation 	"foobar"

		factory :admin do
			admin true
		end
	end	
end