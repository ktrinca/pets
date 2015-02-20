class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :last_name
      t.integer :city_id

      t.timestamps
    end
  end
end
