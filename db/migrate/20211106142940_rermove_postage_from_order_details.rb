class RermovePostageFromOrderDetails < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_details, :postage, :integrt
  end
end
