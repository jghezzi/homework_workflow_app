class Assignment < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :cohort
	has_many :submissions
	accepts_nested_attributes_for :submissions
	
	# all_submissions = Submission.all
	# my_submissions = []
	# all_submissions.each do
	# 	my_submissions << all_submissions(params[:id]
	# end

	# scope :incomplete_assignments, -> { joins(:submissions).where('submissions.assignment_id != ?', my_submissions) }

end