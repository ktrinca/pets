class ChangeProvinceToNameFromProvince < ActiveRecord::Migration
  def change
    rename_column :provinces, :province, :name	
  end
end
