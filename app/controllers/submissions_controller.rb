class SubmissionsController < ApplicationController
	
	def index
		@submissions = Submission.all
	end

	def show
		@submission = Submission.find(params[:id])
		@new_comment = @submission.comments.build
	end

	def review
		authorize! :update, @submission
		@submission = Submission.find(params[:id])
		if @submission.workflow_state != "being_reviewed"
			@submission.review!
		end
	end

	def approve
		@submission = Submission.find(params[:id])
		@submission.accept!
		redirect_to assignments_path
	end

	def reject
		@submission = Submission.find(params[:id])
		@submission.reject!
		redirect_to assignments_path
	end

	def update_state
		authorize! :update, @submission
	end

	def new
		@new_submission = Submission.new
		2.times { @new_submission.submission_links.build }

	end

	def create
		@new_submission = Submission.new(submission_params)
		if @new_submission.save
			@new_submission.submit!
			redirect_to assignments_path
		else
			redirect_to new_submission_path
		end
	end

	private

	def submission_params
		params.require(:submission).permit(:workflow_status, :assignment_id, :user_id, submission_links_attributes: [:description, :submission_id])
	end

end