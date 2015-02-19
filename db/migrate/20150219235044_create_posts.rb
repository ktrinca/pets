class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :address
      t.integer :contact_id
      t.string :image
      t.integer :category_id

      t.timestamps
    end
  end
end
