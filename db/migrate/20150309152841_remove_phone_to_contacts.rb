class RemovePhoneToContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :phone, :string
  end
end
