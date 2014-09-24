class SupplierConfirmationMailer < ActionMailer::Base
  default from: "confirmation@airlift.herokuapp.com"

  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: "You're request has been approved!")
  end
end
