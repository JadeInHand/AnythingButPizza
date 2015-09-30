# == Schema Information
#
# Table name: line_items
#
#  id                 :integer          not null, primary key
#  item_id            :integer
#  shopping_cart_id   :integer
#  quantity_purchased :integer
#  cost               :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  seller_id          :integer
#

class LineItem < ActiveRecord::Base
	belongs_to :shopping_cart
	belongs_to :item
end
