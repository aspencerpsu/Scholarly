class AddIndentifyToUsers < ActiveRecord::Migration
  def change
    add_column :students, :indentity, :string
  end
end
