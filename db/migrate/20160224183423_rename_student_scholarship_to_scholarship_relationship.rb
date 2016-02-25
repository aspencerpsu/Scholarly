class RenameStudentScholarshipToScholarshipRelationship < ActiveRecord::Migration
  def change
  	rename_table :scholarships_students, :scholarshiprelationship
  end
end
