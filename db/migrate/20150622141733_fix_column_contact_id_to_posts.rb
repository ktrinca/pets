class FixColumnContactIdToPosts < ActiveRecord::Migration
  def change
    rename_column :posts, :contact_id, :user_id	
  end
end
