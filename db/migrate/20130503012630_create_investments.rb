class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.references :user
      t.references :property
      t.float :capital

      t.timestamps
    end
    add_index :investments, :user_id
    add_index :investments, :property_id
  end
end
