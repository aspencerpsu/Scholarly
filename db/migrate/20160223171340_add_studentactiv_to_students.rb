class AddStudentactivToStudents < ActiveRecord::Migration
  def change
    add_column :students, :activities, :string
  end
end
