class AddImageIconToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image_icon, :string
  end
end
