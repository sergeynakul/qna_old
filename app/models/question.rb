class Question < ActiveRecord::Base
	validates :title, :body, presence: true
	has_many :answers
	has_many :attachments, as: :attachmentable

	accepts_nested_attributes_for :attachments
end
