class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card, inverse_of: :orders
  has_many :line_items, inverse_of: :order
  # has_many :products, :through => :line_items

  validates :customer_id, :credit_card_id, presence: true
  validate  :equals_customer_cc

  accepts_nested_attributes_for :credit_card
  accepts_nested_attributes_for :line_items

  def self.from_cart(cart)
    order = new
    # "order = new" is the same as "Order.new"
    cart.each do |product_id, quantity|
      order.line_items.build(
          product_id: product_id,
          quantity: quantity
        )
    end
    order.calculate_totals
    order
  end

  def calculate_totals
    self.total_amount = line_items.inject(0) do |sum, li|
      li.set_price
      sum +li.total_price
    end
  end

  def equals_customer_cc
    if customer_id && credit_card_id
      unless customer_id == credit_card_id
        errors.add(:credit_card_id, "The credit card id must match the customer placing the order")
      end
    end
  end

  def increment_total_amount(amount)
    self.total_amount ||= 0
    self.total_amount += total_price
    save!
  end

  def self.total_revenue
    connection.select_value("SELECT sum(total_amount) FROM orders").to_d
  end

  def self.total_revenue_per_customer
    connection.select_all("select customer_id, sum(total_amount)
     from orders
     GROUP BY customer_id")
  end
end
