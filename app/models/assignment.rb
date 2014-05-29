class Assignment < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :cohort
	has_many :submissions
	accepts_nested_attributes_for :submissions
end