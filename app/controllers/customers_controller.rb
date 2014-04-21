class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      CustomerMailer.welcome(@customer).deliver
      redirect_to root_path, notice: "Customer #{@customer.email} was created."
    else
      render "new", notice: "There was an issue creating your account."
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def verify
    customer = Customer.verify.(params[:token])

    if customer
      redirect_to root_path, notice: "Account is confirmed."
    else
      redirect_to root_path, alert: "Account is invalid. Verification link is invalid"
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :password, :name)
  end
end
