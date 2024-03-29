class OrdersController < ApplicationController

  def new
    @order = Order.from_cart(cart)
    @order.build_credit_card
  end

  def create
    @order = Order.new
    @order.customer = current_customer
    order_params[:credit_card_attributes][:customer_id] = current_customer.id
    Rails.logger.info order_params.inspect
    @order.attributes = order_params

    if @order.save
      session[:cart] = nil
      redirect_to @order, success: "Your order was placed! Your order id is #{@order.id}"
    else
      @order.calculate_totals
      render 'new'
    end

  end

  def show
    @order = Order.find(params[:id])
  end

  protected
  def order_params
    @order_params ||= params.require(:order).
      permit(
        credit_card_attributes: [:card_number, :expires_on],
        line_items_attributes: [:product_id, :quantity])
  end
end
