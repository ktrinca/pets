class AddContactIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :contact_id, :integer
  end
end
