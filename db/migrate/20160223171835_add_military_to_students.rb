class AddMilitaryToStudents < ActiveRecord::Migration
  def change
    add_column :students, :militaryservice, :string
  end
end
