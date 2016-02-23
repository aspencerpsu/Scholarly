class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :students, :gender, :integer, :default => 1
  end
end
