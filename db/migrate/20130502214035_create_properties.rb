class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :country_code
      t.string :city
      t.string :state
      t.string :address
      t.string :description
      t.float :purchase_value
      t.float :irr
      t.float :client_irr
      t.float :available_value

      t.timestamps
    end
  end
end
