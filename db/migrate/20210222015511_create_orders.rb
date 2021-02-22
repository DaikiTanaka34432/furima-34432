class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item,     null: false, foreign_keys: true 
      t.references :user,     null: false, foreign_keys: true 
      t.timestamps
    end
  end
end
