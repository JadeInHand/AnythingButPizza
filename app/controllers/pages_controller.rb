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
    # @my_items = LineItem.where(: )
    @sold_items = LineItem.all
    @sold_items.each do |thing|
      if thing.seller_id == @current_user.id
          @on_the_way << thing.shopping_cart.user
      end
    end
  end
end
