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
    unless @items.nil?
      @items.each do |item|
        @whats_ordered << item.line_items if !item.line_items.empty?
      end
    end

    unless @whats_ordered.empty?
      @whats_ordered[0].each do |order|
        unless order.shopping_cart.nil?
          @on_the_way << [(User.find order.shopping_cart.user_id).name, order.shopping_cart.user_id, order.item.name, order.quantity_purchased]
        end
      end
    end

  end
end
