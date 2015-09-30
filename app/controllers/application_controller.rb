class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :fetch_current_user, :fetch_current_shopping_cart, :destroy_shopping_cart
  
  private
  def fetch_current_user
      if session[:user_id].present?
          @current_user = User.find_by :id => session[:user_id]
          session[:user_id] = nil unless @current_user.present?
      end
  end

  def fetch_current_shopping_cart
    if session[:shopping_cart_id].present?
      @current_shopping_cart = ShoppingCart.find_by :id => session[:shopping_cart_id]
      session[:shopping_cart_id] = nil unless @current_shopping_cart.present?
    end
  end

  # Calls the function to destroy a shopping cart if the shopping cart has been inactive for more than 20 minutes
  def destroy_shopping_cart
    if session[:shopping_cart_id].present?
      @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
      if @shopping_cart.not_secure?( @current_user )
        @shopping_cart.destroy
        session[:shopping_cart_id] = nil
      end
    end
  end
end