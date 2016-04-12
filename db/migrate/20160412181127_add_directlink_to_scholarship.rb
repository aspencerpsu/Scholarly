class AddDirectlinkToScholarship < ActiveRecord::Migration
  def change
    add_column :scholarships, :directlink, :string
  end
end
