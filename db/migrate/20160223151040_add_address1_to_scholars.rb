class AddAddress1ToScholars < ActiveRecord::Migration
  def change
    add_column :students, :address1, :string
  end
end
