class AddImage1ToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image_1, :string
  end
end
