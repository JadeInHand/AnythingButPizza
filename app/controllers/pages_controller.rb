class PagesController < ApplicationController
  def home
  	@top5 = Item.where(:active => true)
  end

  def cook
  	@items = Item.where(:user_id => @current_user.id)
  	@yum_items = [] # current items by current_user
  	@past_yums = [] 
  	@items.each do |thing|
  		if thing.active == true
  			@yum_items << thing
  		else 
  			@past_yums << thing
  		end
  	end
  end


  def place
  end

end
