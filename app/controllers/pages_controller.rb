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

    @on_the_way = []
    @sold_items = @current_user.items
    @sold_items.each do |thing|
      thing.line_items.each do |line_item|
        @on_the_way << line_item.shopping_cart.user
      end
      # end
    end
    @on_the_way.uniq!
  end
end
