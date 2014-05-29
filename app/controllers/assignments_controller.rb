class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		@new_assignment.submissions.build
	end

	private

	def assignment_params
		params.require(:assignment).permit(:description, :cohort_id, submissions_attributes: [:workflow_status, :assignment_id, :user_id])
	end

end