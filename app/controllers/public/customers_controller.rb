class Public::CustomersController < ApplicationController

  def mypage
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(current_customer)
    redirect_to public_customers_mypage_path
  end

  def top
   @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_active: faise)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code,
                   :address, :telephone_number, :email)
  end
end
