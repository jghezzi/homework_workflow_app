class AssignmentsController < ApplicationController

	def index
		@assignments = Assignment.all
	end

	def new
		@new_assignment = Assignment.new
		authorize! :create, @new_assignment
	end

	def create
		@new_assignment = Assignment.new(assignment_params)
		@new_assignment.save
		redirect_to assignments_path
		authorize! :create, @new_assignment
	end

	def show
		@assignment = Assignment.find(params[:id])
		@new_comment = @assignment.comments.build
	end

	def show_links
		@assignment = Assignment.find(params[:id])
		@submissions = Submission.all
		@submission_links = SubmissionLink.all
	end

	private

	def assignment_params
		params.require(:assignment).permit(:description, :cohort_id, :title, submissions_attributes: [:workflow_status, :assignment_id, :user_id])
	end

end