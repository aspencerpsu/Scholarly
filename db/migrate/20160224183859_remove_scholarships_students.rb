class RemoveScholarshipsStudents < ActiveRecord::Migration
  def change
  	drop_table :scholarship_students
  end
end
