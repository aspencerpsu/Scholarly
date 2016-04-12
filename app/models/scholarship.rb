class Scholarship < ActiveRecord::Base
	has_many :scholarships_students
	has_many :studentfollowers, through: :scholarships_students, source: :student
	validates :value, format: { without: /\A\${1}/ && /\,/,
    message: "only allows numbers" }
    validates :value, numericality: true

	def start_time
		self.deadline
	end
end
