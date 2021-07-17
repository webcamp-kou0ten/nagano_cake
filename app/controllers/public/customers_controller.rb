class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer)
  end

  def edit
    @customer = Customer.find(current_customer)
  end

  def update
    @customer = Customer.find(current_customer)
    @customer.update(customer_params)
    redirect_to public_customers_path(current_customer)
  end

  def unsubscribe
  end

  def exit
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
