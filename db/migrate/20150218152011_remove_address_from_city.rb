class RemoveAddressFromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :address, :string
  end
end
