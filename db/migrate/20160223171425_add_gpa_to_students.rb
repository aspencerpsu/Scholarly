class AddGpaToStudents < ActiveRecord::Migration
  def change
    add_column :students, :gpa, :decimal
  end
end
