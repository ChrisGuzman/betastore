class UserMailer < ActionMailer::Base
  default from: "enigmatic-ocean-5866.herokuapp.com/"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(customer)
    @customer = customer
    # @url = "http://localhost:3000/sign_up"
    @token = Rails.application.message_verifier('customer').generate(@customer.id)
    mail to: @customer.email
    # binding.pry
  end

  # def welcome_email(user)
  #   @user = user
  #   @url = "http://localhost:3000/sign_up"
  #   mail(to: @user.email, subject: "Verfiy your account")
  # end
end
