class CreateUserTable < ActiveRecord::Migration
def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.decimal :cash_balance
      t.string :password_digest
      t.timestamps
    end
end


end
