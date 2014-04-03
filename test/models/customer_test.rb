require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_create
    customer = Customer.new(name:"Chris", email:"Chris@example.com")
    assert customer.save!
  end

  def test_duplicate_email
    customer = Customer.new(name:"Sammy", email:"sammy@example.com")
    assert customer.save!
  end

  def test_first
    assert_equal "Sam", Customer.first.name
  end


end
