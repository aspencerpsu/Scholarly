class RenameScholarshipRelationshipsToScholarshipsStudents < ActiveRecord::Migration
  def change
  	rename_table :scholarshiprelationships, :scholarships_students
  end
end
