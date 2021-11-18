class Public::AddressesController < ApplicationController

  before_action :authenticate_customer!,except: [:root_path]

  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = current_customer.addresses.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
     @address = Address.find(params[:id])
     @address.customer_id = current_customer.id
     @address.update(address_params)
     redirect_to public_addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy(address_params)
    redirect_to public_addresses_path
  end

  private

    def address_params
      params.require(:address).permit(:customer_id, :name, :postal_code, :address)
    end
end
