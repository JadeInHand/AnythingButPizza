class SessionsController < ApplicationController
  def new
  end

  # creating a new user session when a user logs in
  def create
      user = User.find_by :email => params[:email]
      if user.present? && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path
      else
          redirect_to login_path
      end
  end

  # deleting a user session when the current user logs out
  def destroy
    session[:user_id] = nil
    session[:shopping_cart_id] = nil
    redirect_to root_path
  end
end
