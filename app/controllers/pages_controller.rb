class PagesController < ApplicationController
  def home
  	@top5 = Item.where(:active => true)
  end
end
