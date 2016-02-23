class AddMajorsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :majors, :string
  end
end
