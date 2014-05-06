class LoginsController < ApplicationController
  skip_before_action :require_login

  def create
    customer = Customer.find_by(email: params[:email])
    if customer.try(:authenticate, params[:password])
      set_current_customer(customer)
      redirect_to after_login_path, notice: "Welcome back, #{current_customer.name}! You are now logged in."
    else
      flash.now[:danger] = 'Log In Failed'
      redirect_to 'new'
    end
  end

  def destroy
    set_current_customer(nil)
    redirect_to root_path,
      info: 'You have been logged out.'
  end
end
