class VerificationsController < ApplicationController
  before_filter :get_user
  skip_before_filter :verify_authenticity_token,

  def create
    body = params['Body'].downcase

    case
    when body.include?('status') then text(send_status)
    end

    head :ok
  end

  private

  def send_status
    last_order = @user.orders.last
    this = last_order.sub_orders.map do |order|
      "Your order from #{order.supplier.name} is #{order.status}"
    end
    return this.flatten
  end

  def text(text_body)
    client = Twilio::REST::Client.new('AC9601317f1702968a45d706de9767ce13', '62d1588091664ed1634707827e0ae48f')
    client.account.sms.messages.create(
      from: '+17792039177',
      to: @user.phone_number,
      body: text_body
    )
  end

  def get_user
    unless @user = User.find_by(phone_number: params['From'])
      head :not_found
    end
  end

end
