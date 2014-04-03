class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :credit_card
  has_many :line_items
  has_many :products, :through => :line_items

  validates :customer_id, presence: true
  validates :credit_card_id, presence: true
  validate  :equals_customer_cc

  def equals_customer_cc
    if customer_id && credit_card_id
      unless customer_id == credit_card_id
        errors.add(:credit_card_id, "The credit card id must match the customer placing the order")
      end
    end
  end

  def calculate_total_amount
    self.total_amount = line_items.inject(0) { |sum, li|
      sum + li.total_price
    }
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
