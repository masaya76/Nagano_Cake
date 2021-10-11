class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :_id
      t.integer :order_id
      t.integer :get_payment
      t.integer :amount
      t.integer :postage
      t.integer :making_status

      t.timestamps
    end
  end
end
