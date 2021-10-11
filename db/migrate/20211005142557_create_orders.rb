class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :shipping_postal_code
      t.string :shipping_address
      t.string :delivery_name
      t.integer :payment
      t.integer :peyment_method
      t.integer :status

      t.timestamps
    end
  end
end
