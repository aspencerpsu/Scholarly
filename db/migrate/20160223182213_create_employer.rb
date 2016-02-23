class CreateEmployer < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :name
      t.string :scholarship
      t.string :value
      t.date :deadline
    end
  end
end
