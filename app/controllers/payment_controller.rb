class PaymentController < ApplicationController
	protect_from_forgery :except => [	:create]
	def new
		@cost = ShoppingCart.find(session[:shopping_cart_id]).total_cost
		@shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
  end

  def create
    # cook's address where the buyer is redirected ( by google maps ) to collect food once his payment is done
    @li = LineItem.find_by(:shopping_cart_id => session[:shopping_cart_id])
    gon.address = @li.item.user.address

    # Amount in cents is paid to ABP
    @amount = ShoppingCart.find(session[:shopping_cart_id]).total_cost * 100


    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Payment to ABP',
      :currency    => 'usd'
    )

    # Once the payment has been made, the number of servings is updated on the items table
    cart = ShoppingCart.find(session[:shopping_cart_id])
    cart.line_items.each do |lineItem| 
      item = Item.find(lineItem.item_id)
      item.update :servings => item.servings_left        
    end

    # The shopping cart is set to false once the transaction is complete
    cart.update :active => false
    cart.update :paid => true

  # In case of an error while paying, the rescue block is used for displaying the error message
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to payment_path
  end
end
