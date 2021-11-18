class RenameIdColumnToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_details, :_id, :item_id
  end
end
