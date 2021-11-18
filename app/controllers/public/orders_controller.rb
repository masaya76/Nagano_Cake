class Public::OrdersController < ApplicationController

  before_action :authenticate_customer!,except: [:root_path]

  def new
    # @order = current_customer.order
    # @cart_item.customer_id = current_customer.id
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new(order_params)

    @order.customer_id = current_customer
    @cart_items = current_customer.cart_items
    @orders = current_customer.orders
    @order.postage = 800
    if params[:order][:select_address] == "main"
      @order.shipping_postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "yours"
      address = Address.find(params[:order][:address_id])
      @order.shipping_postal_code = address.postal_code
      @order.shipping_address = address.address
      @order.delivery_name = address.name
    end

  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = "入金確認"
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.get_payment = cart_item.item.with_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.making_status = "製作待ち"
      @order_detail.item_id = cart_item.item_id
      @order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to public_orders_top_path
  end


  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    # @order_detail = OrderDetail.find(params[:id])
    @orders = current_customer.orders
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :delivery_name,
                                  :payment, :peyment_method, :postage, :status)
  end

  # def order_detail_params
  #   params.require(:order_detail).permit(:item_id, :order_id, :get_payment, :amount, :making_status)
  # end

end
