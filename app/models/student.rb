class Student < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password 
	validates_presence_of :password, on: :create

	has_many :scholarships_students
	has_many :followingfunds, through: :scholarships_students, source: :student
end
