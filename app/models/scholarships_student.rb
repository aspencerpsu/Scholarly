class ScholarshipsStudent < ActiveRecord::Base
	belongs_to :scholarship
	belongs_to :student
end
