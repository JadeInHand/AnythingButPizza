# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :text
#  email           :text
#  address         :text
#  latitude        :float
#  longitude       :float
#  postcode        :string
#  image           :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :text
#  admin           :boolean
#

class User < ActiveRecord::Base
	geocoded_by :address
	validates :address, :presence => true
	after_validation :geocode

	has_secure_password
	has_many :items
	has_many :shopping_carts

	validates :email, :presence => true, :uniqueness => true
	validates :name, :presence => true, :length => { :minimum => 3 }
end







