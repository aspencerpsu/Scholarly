class ChangeGpaFromScholarship < ActiveRecord::Migration
  def change
  	change_column :scholarships, :gpa, :decimal, :default => 0.0
  end
end
