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
	has_many :line_items
	belongs_to :user

	def total_cost
		total = 0
		self.line_items.each do |item|
			total += (item.cost * item.quantity_purchased)
		end
		total
	end
end
