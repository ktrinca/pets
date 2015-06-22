class RemoveCityIdFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :city_id, :integer
  end
end
