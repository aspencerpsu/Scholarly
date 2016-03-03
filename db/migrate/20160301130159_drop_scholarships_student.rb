class DropScholarshipsStudent < ActiveRecord::Migration
  def change
  	drop_table :scholarships_students
  end
end
