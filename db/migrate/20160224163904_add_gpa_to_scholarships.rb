class AddGpaToScholarships < ActiveRecord::Migration
  def change
    add_column :scholarships, :gpa, :decimal
  end
end
