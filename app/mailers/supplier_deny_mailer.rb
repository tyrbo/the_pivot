class SupplierDenyMailer < ActionMailer::Base
  default from: "error@airlift.herokuapp.com"

  def deny_email(user)
    @user = user

    mail(to: @user.email, subject: "There was an error with your request")
  end
end
