# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  name        :text
#  servings    :integer
#  cost        :float
#  description :text
#  tags        :text
#  image       :text
#  active      :boolean
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ActiveRecord::Base
	has_many :line_items
	belongs_to :user
	belongs_to :category
end
