class CreateJoinTableScholarshipsStudents < ActiveRecord::Migration
  def change
    create_join_table :scholarships, :students do |t|
      t.index [:scholarship_id, :student_id]
      t.index [:student_id, :scholarship_id]
    end
  end
end
