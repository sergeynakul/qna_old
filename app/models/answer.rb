class Answer < ActiveRecord::Base
	belongs_to :question
	has_many :attachments, as: :attachmentable
	has_many :comments, as: :commentable

	validates :body, presence: true

	accepts_nested_attributes_for :attachments
end
