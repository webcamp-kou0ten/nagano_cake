class Admin::CustomersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    # ページャーを使用
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      flash[:notice] = "お客様情報を更新しました"
      redirect_to admin_customer_path(customer)
    else
      @customer = Customer.find(params[:id])
      flash[:notice] = "情報更新に失敗しました"
      render "edit"
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:customer_status)
    end

end