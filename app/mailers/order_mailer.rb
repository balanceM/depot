class OrderMailer < ApplicationMailer
  default from: '286515744@qq.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  # => 
  #   en.order_mailer.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end

  def contact(recipient, subject, message)
    mail(:to=>recipient, :subject=>subject) do |format|
      format.html { render :text => message }
    end
 end
end
