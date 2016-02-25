class Scholarship < ActiveRecord::Base
	has_many :scholarships_students
	has_many :studentfollowers, through: :scholarships_students, source: :student
end
