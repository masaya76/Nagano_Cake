class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to public_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
  end
  
  def update
     @address = Address.find(params[:id])
     @address.save
     render index
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    render index
  end

  private

    def address_params
      params.require(:address).permit(:customer_id, :name, :postal_code, :address)
    end
end
