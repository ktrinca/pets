class AddPetFromPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pet, :integer
  end
end
