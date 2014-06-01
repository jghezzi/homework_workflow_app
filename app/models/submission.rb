class Submission < ActiveRecord::Base
	include Workflow
	
	workflow do
    state :new do
      event :submit, :transitions_to => :awaiting_review
    end
    state :awaiting_review do
      event :review, :transitions_to => :being_reviewed
    end
    state :being_reviewed do
      event :accept, :transitions_to => :accepted
      event :reject, :transitions_to => :rejected
    end
    state :accepted
    state :rejected
  end

	belongs_to :assignment
	belongs_to :user
	has_many :comments, as: :commentable
	has_many :submission_links
	accepts_nested_attributes_for :submission_links

end
