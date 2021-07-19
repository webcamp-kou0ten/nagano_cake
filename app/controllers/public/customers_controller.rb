class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to public_customers_path(current_customer)
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def exit
    @customer = Customer.find(current_customer.id)
    @customer.customer_status = "true"
    @customer.save
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  end

end
