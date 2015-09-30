# == Schema Information
#
# Table name: shopping_carts
#
#  id           :integer          not null, primary key
#  total_cost   :integer
#  order_number :integer
#  user_id      :integer
#  active       :boolean
#  paid         :boolean          default(FALSE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	
	# calculates the total cost pertaining to each item on a shopping cart
  def total_cost
		total = 0
		self.line_items.each do |item|
			total += (item.cost * item.quantity_purchased)
		end
		total
	end
	
	def summary
        counts = {}
        self.line_items.each do |li|
            counts[li.item.name] = 0 if counts[li.item.name].nil?
            counts[li.item.name] += li.quantity_purchased
        end
        counts
    end

  # if a shopping cart has been inactive for more than 20 minutes ( no payment made ), then it ceases to exist
	def not_secure?(user)
   	  !user || 
      created_at.nil? || 
      (Time.now - created_at > (60 * 20) )
  end
end
