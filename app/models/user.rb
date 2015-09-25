# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :text
#  email      :text
#  address    :text
#  latitude   :float
#  longitude  :float
#  postcode   :string
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	has_many :items
	has_many :shopping_carts
end
