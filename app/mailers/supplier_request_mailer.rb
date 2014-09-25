class SupplierRequestMailer < ActionMailer::Base
  default from: "request@airlift.herokuapp.com"

  def request_email(supplier)
     @supplier = supplier

     @user = @supplier.users.first
    mail(to: @user.email, subject: "Your store has recieved a new request")
  end
end
