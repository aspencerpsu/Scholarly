class AddAddress2ToStudents < ActiveRecord::Migration
  def change
    add_column :students, :address2, :string
  end
end
