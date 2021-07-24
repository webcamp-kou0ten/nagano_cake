class Public::AddressesController < ApplicationController

  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end

  def create
     address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save
      redirect_to public_addresses_path
    else
      flash[:notice] = "郵便番号、住所を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to public_addresses_path
    else
      flash[:notice] = "郵便番号、住所を再度ご確認ください。"
      redirect_to request.referer
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to public_addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
