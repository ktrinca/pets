class RemoveAddress2FromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :address_2, :string
  end
end
