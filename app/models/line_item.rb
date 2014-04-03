class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  validates :order_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, allow_blank: true }
  before_validation :set_price
  after_save :increment_order_total_amount
  def set_price
    self.price = product.price
  end

  def total_price
    self.price * self.quantity
  end

  def increment_order_total_amount
    order.increment_total_amount(total_price)
  end
end
