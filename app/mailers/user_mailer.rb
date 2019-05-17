class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_receipt(order)
    @user = order.email
    @id = order.id
    @order = order
    @url  = 'http://localhost:3000/login'
    mail(to: @user, subject: "Your order is placed #{@id} ")
  end
end
