class ChangeCityToNameFromCity < ActiveRecord::Migration
  def change
  	rename_column :cities, :city, :name
  end
end
