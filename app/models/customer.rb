class Customer < ActiveRecord::Base
  has_many :orders
  has_many :credit_cards
  has_many :line_items, through: :orders
  has_many :products, through: :line_items

  validates :password, presence: true
  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: true
end
