# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  types      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
	has_many :items
end
