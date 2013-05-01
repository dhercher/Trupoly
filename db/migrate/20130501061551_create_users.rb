class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :account_total
      t.string :account_invested
      t.string :account_balance

      t.timestamps
    end
  end
end
