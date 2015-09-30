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
    @whats_ordered = []
    @items.each do |item|
      @whats_ordered << item.line_items if !item.line_items.empty?
    end

    @whats_ordered[0].each do |order|
      @on_the_way << [(User.find order.shopping_cart.user_id).name, order.shopping_cart.user_id, order.item.name, order.quantity_purchased]
    end



  #   @sold_items = @sold_items.
  #   @sold_items.each do |thing|
  #     thing.line_items.each do |line_item|
  #       if line_item.shopping_cart.active == false
  #         if line_item.shopping_cart.paid == true
  #           @on_the_way << line_item.shopping_cart.user
  #         end
  #       end
  #     end
  #   end
  #   @on_the_way.uniq!
  end
end
