class Question < ActiveRecord::Base
	validates :title, :body, presence: true
	has_many :answers
end
