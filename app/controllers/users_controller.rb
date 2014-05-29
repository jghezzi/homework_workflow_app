class UsersController < ApplicationController
	before_filter :authenticate_user!

	def cohort_signup 
		@cohorts = Cohort.all
		@user = current_user
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		redirect_to cohort_signup_path
	end

	private

	def user_params
		params.require(:user).permit!
	end

end