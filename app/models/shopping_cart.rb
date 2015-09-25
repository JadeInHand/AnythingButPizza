# == Schema Information
#
# Table name: shopping_carts
#
#  id           :integer          not null, primary key
#  quantity     :integer
#  order_number :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShoppingCart < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
end
