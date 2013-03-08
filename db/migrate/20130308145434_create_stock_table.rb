class CreateStockTable < ActiveRecord::Migration
def change
    create_table :stocks do |t|
      t.string :ticker
      t.decimal :init_value
      t.integer :shares
      t.integer :user_id
      t.timestamps
end
end
end
