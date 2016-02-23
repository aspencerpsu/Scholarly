class AddCellToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cell, :integer
  end
end
