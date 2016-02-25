class RenameStudentScholarshipToScholarshipRelationships < ActiveRecord::Migration
  def change
  	rename_table :scholarshiprelationship, :scholarshiprelationships
  end
end
