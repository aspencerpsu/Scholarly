class ChangeFromStudents < ActiveRecord::Migration
  def change
  	change_column :students, :cell, :bigint
  end
end
