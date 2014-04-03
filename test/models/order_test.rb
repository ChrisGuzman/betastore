require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_create
    order = Order.new
    refute order.save
  end

  def test_create_another
    order = Order.new
    refute order.save
  end

  def test_first
    assert_equal 4, Order.first.total_amount
  end

  def test_total_revenue
    assert_equal 50, Order.total_revenue
  end

  def test_credit_card_id
    order = Order.new(customer_id: 1, credit_card_id: 1)
    assert order.save!
  end
end
