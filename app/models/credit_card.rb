require 'date'

class FutureExpiry < ActiveModel::Validator
  def validate(record)
    expiring_date = record.expires_on
    valid_expiring_date = Date.strptime(expiring_date, '%m/%Y')
    if valid_expiring_date.past?
      record.errors[:base] << "Credit Card must expire in future"
    end
  end
end

class CreditCard < ActiveRecord::Base
  belongs_to :customer
  has_many :orders

  validates_with FutureExpiry
  validates :customer_id, presence:true
  validates :card_number,
    presence: true,
    length: { minimum: 15 },
    format: { with: /\A\d{15,}\z/}
  validates :expires_on, presence: true,
                         format: { with: /\A\d{2}\/\d{4}\z/, allow_blank: true }
                         # if: :expires_in_future()



  # def expires_at_future_date?
  #   self.expires_on.future?
  # end

  # def expires_in_future(expiring_date)
  #   puts expiring_date.to_s
  # end

  def expiry=(expiry)
    self.expires_on = Date.strptime(expiry, '%m/%y') +1.month
  end
end
