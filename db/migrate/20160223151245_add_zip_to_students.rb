class AddZipToStudents < ActiveRecord::Migration
  def change
    add_column :students, :zip, :integer
  end
end
