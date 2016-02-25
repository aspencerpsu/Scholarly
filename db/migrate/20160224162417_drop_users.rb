class DropUsers < ActiveRecord::Migration
  def change
  	drop_table :users, force: :cascade do |t|
  		t.string :fname
  		t.string :password_digest
  		t.string :email
  		t.timestamps null: false
  	end
  	remove_column :posts, :user_id
  end
end
