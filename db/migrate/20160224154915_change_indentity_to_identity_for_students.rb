class ChangeIndentityToIdentityForStudents < ActiveRecord::Migration
  def change
  	rename_column :students, :indentity, :identity
  end
end
