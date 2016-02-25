class ChangeHomeFromStudents < ActiveRecord::Migration
  def change
  	change_column :students, :home, :bigint
  end
end
