include ApplicationHelper

def valid_signin(user)
	fill_in "Email", 	with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"
end

def valid_signup_fill
	fill_in "Name",			with: "Ryan Darge"
	fill_in "Email",		with: "example.email@mail.com"
	fill_in "Password",		with: "foobar"
	fill_in "Confirmation",	with: "foobar"
end

RSpec::Matchers.define :have_success_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-success', text:message)
	end
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text:message)
	end
end

RSpec::Matchers.define :have_error_reason do |message|
	match do |page|
		expect(page).to have_selector('li', text:message)
	end
end
