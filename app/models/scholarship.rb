class Scholarship < ActiveRecord::Base
	has_many :scholarships_students
	has_many :studentfollowers, through: :scholarships_students, source: :student
	before_save :run_strip

	def start_time
		self.deadline
	end

	def run_strip()
		self.value.gsub!(/\$?/, "")
	end
end
