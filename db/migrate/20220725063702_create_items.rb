class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :item_name,              null: false
      t.integer :item_category_id,      null: false
      t.integer :item_condition_id,     null: false
      t.integer :item_address_id,       null: false
      t.text :item_explanation,         null: false
      t.integer :delivery_category_id,  null: false
      t.integer :delivery_dey_id,       null: false
      t.integer :price,                 null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
