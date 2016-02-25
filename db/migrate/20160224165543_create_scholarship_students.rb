class CreateScholarshipStudents < ActiveRecord::Migration
  def change
    create_table :scholarship_students do |t|

      t.timestamps null: false
    end
  end
end
