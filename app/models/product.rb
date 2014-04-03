  class Product < ActiveRecord::Base
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :orders, :through => :line_items

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than: 0,
                                    allow_blank: true }
                    # numericality: { equal_to: 1 }
end
