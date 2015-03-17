class AddTypesFromPosts < ActiveRecord::Migration
  def change
    add_column :posts, :types, :integer
  end
end
