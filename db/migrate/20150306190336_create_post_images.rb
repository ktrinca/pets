class CreatePostImages < ActiveRecord::Migration
  def change
    create_table :post_images do |t|
      t.string :image
      t.integer :position

      t.timestamps
    end
  end
end
