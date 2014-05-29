class CohortsController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@cohorts = Cohort.all
	end
end