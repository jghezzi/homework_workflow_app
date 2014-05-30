class CommentsController < ApplicationController
	def create
		@new_comment = Comment.new(comment_params)
		if @new_comment.save
			redirect_to assignments_path
		else
			render assignments_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit!
	end

end