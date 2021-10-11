class Admin::OrdersController < ApplicationController


  def show
    @order = Order.find(params[:id])
    @order_details = @item.order_details
  end

  def update
    @order = Order.find(params[:id])
  end

private

  def order_params
    params.require(:order).permit(:status, :making_status)
  end

end