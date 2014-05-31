class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
	end

	# def update
	# 	@user = User.find(user_params)
	# 	@user.update_attributes
	# end

	def cohort_signup
		if current_user.cohort_id != nil
			redirect_to assignments_path, notice: "Already enrolled in #{current_user.cohort.description} #{current_user.cohort.location.name}"
		else 
			@cohorts = Cohort.all
			@user = current_user
		end
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