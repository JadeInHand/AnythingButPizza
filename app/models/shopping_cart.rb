# == Schema Information
#
# Table name: shopping_carts
#
#  id           :integer          not null, primary key
#  total_cost   :integer
#  order_number :integer
#  user_id      :integer
#  active       :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
	#extend ActiveModel::Callbacks
	has_many :line_items
	belongs_to :user
	#before_filter :require_secure
    #define_model_callbacks :require_secure

	def total_cost
		total = 0
		self.line_items.each do |item|
			total += (item.cost * item.quantity_purchased)
		end
		total
	end

  	def require_secure
  		if not_secure?
  			sc = ShoppingCart.find(session[:shopping_cart_id])
  			sc.destroy
     		redirect_to login_path 
     	end
     	return
  	end

	def not_secure?
   	    !@current_user ||
    	session[:created_at].nil? ||
    	(Time.now - session[:created_at] > (60 * 20) )
  	end
end