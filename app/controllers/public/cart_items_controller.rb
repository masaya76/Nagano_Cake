class Public::CartItemsController < ApplicationController
  
  before_action :authenticate_customer!,except: [:root_path]
  
  def index
    @cart_items = current_customer.cart_items
    @tax = 1.1
  end

  def create
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    # redirect_to public_cart_item_path(@cart_item), method: :patch
    else
      @cart_item.save
      redirect_to public_cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy   #destroy後の(cart_item_params)外す
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
