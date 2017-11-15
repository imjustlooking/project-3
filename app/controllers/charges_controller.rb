class ChargesController < ApplicationController
  def new

  end

  def create
    @user =current_user
    @shoppinglist = Shoppinglist.find(params[:id])
    @amount = (@shoppinglist.total_price*100).to_i

  customer = Stripe::Customer.create(
    email: params[:stripeEmail],
    source: params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'usd'
  )
  
  @shoppinglist.update(params.permit(:paid_on))
  @shoppinglist.update_column(:paid_on, DateTime.now.to_s)

  UserShoppinglistEmailMailer.notify_user(@user, @shoppinglist).deliver_now

  rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  end
end
