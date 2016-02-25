class AddReferenceAdminToScholarships < ActiveRecord::Migration
  def change
  	add_reference :scholarships, :provider, index: true, foreign_key: true
  end
end
