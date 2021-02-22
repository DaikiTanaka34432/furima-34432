class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,  null: false
      t.integer     :prefecture_id,   null: false
      t.string     :city,         null: false
      t.string     :house_number, null: false
      t.string     :house_name
      t.string     :telephone,    null: false
      t.references :order,        null: false, foreign_keys: true
      t.timestamps
    end
  end
end
