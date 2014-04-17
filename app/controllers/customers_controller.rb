class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      UserMailer.welcome(@user).deliver
      redirect_to new_customer_path, notice: "User #{@customer.email} was created."
    else
      render "new", notice: "There was an issue creating your account."
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :name)
  end
end
