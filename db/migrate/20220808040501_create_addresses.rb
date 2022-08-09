class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :address_number,       null: false
      t.integer    :item_address_id,   null: false
      t.string     :address_city,            null: false
      t.string     :address_house,           null: false
      t.string     :address_building, null: false
      t.string     :phone_number,           null: false
      t.references :record,          foreign_key: true
      t.timestamps
    end
  end
end