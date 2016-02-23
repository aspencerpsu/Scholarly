class AddHomeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :home, :integer
  end
end
