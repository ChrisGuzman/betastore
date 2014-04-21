class CustomerMailer < ActionMailer::Base
  default from: "test@example.com"

    def welcome(customer)
    @customer = customer
    @name = customer.name
    @token = Rails.application.message_verifier('customer').generate(@customer.id)
    mail to: @customer.email
    # binding.pry
  end
end
