class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city
      t.integer :province_id
      t.string :address
      t.string :address_2

      t.timestamps
    end
  end
end
