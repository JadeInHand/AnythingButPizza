class PaymentController < ApplicationController
	protect_from_forgery :except => [	:create]
	def new

		@cost = ShoppingCart.find(session[:shopping_cart_id]).total_cost
		@shopping_cart = ShoppingCart.find(session[:shopping_cart_id])

    end

    def create

      gon.address = @current_user.address

      # Amount in cents
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


      cart = ShoppingCart.find(session[:shopping_cart_id])
      cart.update :active => false

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to payment_path
    
    end


end
