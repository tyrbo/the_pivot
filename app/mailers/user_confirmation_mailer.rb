class UserConfirmationMailer < ActionMailer::Base
  default from: "confirmation@airlift.herokuapp.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Airlift!")
  end
end
