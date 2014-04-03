require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_create
    product = Product.new(name: "Macbook", price: 1)
    assert product.save!
  end

  def test_price_as_a_string
    product = Product.new(name: "Chair", price: "10")
    assert product.save!
  end
end
