class RemoveTypesFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :types, :integer
  end
end
