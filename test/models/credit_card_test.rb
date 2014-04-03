require 'test_helper'

class CreditCardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_create
    cc = CreditCard.new(card_number: "123451234512345", expires_on: "11/2011")
    expiring_date = cc.expires_on
    valid_date = Date.strptime(expiring_date, '%m/%Y')
    puts valid_date
    puts valid_date.future?
    refute cc.save
  end

  def test_only_numbers
    cc = CreditCard.new(card_number: "1234567890987654321", expires_on: "10/1111")
    expiring_date = cc.expires_on
    valid_date = Date.strptime(expiring_date, '%m/%Y')
    puts valid_date
    puts valid_date.future?
    refute cc.save
  end

  def test_expires_on
    cc = CreditCard.new(card_number: "123451234512345", expires_on: "02/2014")
    expiring_date = cc.expires_on
    valid_date = Date.strptime(expiring_date, '%m/%Y')
    puts valid_date
    puts valid_date.future?
    refute cc.save
  end

  def test_properly_formated_date
    cc = CreditCard.new(card_number: "0987654321234567890", expires_on: "12/2035")
    expiring_date = cc.expires_on
    valid_date = Date.strptime(expiring_date, '%m/%Y')
    puts valid_date
    puts valid_date.future?
    assert cc.save
  end

  def test_expires_on_past_date
    cc = CreditCard.new(card_number: 1029384756574839201, expires_on: "01/1991")
    expiring_date = cc.expires_on
    valid_date = Date.strptime(expiring_date, '%m/%Y')
    puts valid_date
    puts valid_date.future?
    refute cc.save


  end
end
