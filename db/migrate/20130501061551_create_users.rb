class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.float :account_total
      t.float :account_invested
      t.float :account_balance

      t.timestamps
    end
  end
end
