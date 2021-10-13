class RemoveResetPasswordTokenFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :reset_password_token, :string
  end
end
