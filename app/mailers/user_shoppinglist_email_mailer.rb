class UserShoppinglistEmailMailer < ApplicationMailer
  def notify_user(user, shoppinglist)
    @user = user
    @shoppinglist = shoppinglist

    mail(to: @user.email, subject: "Thank you for order" )
  end
end
