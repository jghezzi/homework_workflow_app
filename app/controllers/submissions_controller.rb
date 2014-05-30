class SubmissionsController < ApplicationController
	def new
		@new_submission = Submission.new
		2.times { @new_submission.submission_links.build }
	end

	def create
		@new_submission = Submission.new(submission_params)
		if @new_submission.save
			redirect_to submissons_path
		else
			redirect_to new_submission_path
		end
	end

	private

	def submission_params
		params.require(:submission).permit(:workflow_status, :assignment_id, :user_id, submission_links_attributes: [:description, :submission_id])
	end

end