require 'spec_helper'

feature "Permissions" do

	scenario "Sign Up" do
		visit "/users/sign_up"
		fill_in "user_name", with: "my name"
		fill_in "email", with: "user@email.com"
		fill_in "password", with: "password"
		fill_in "password_confirmation", with: "password"

		current_path.should eq('/users/sign_up')

	end

end
	
