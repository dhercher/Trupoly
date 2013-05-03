class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :user
      t.references :property
      t.float :investment

      t.timestamps
    end
    add_index :purchases, :user_id
    add_index :purchases, :property_id
  end
end
