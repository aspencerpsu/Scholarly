class AddIdToScholarshipsStudent < ActiveRecord::Migration
  def change
  	add_column :scholarships_students, :id, :primary_key
  end
end
