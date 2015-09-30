class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    lineItem_details = line_item_params
    
    if ( !session[:shopping_cart_id] || !ShoppingCart.find(session[:shopping_cart_id]).active )
      @shopping_cart = ShoppingCart.new(:user_id => @current_user.id, :active => true)
      @shopping_cart.save
      session[:shopping_cart_id] = @shopping_cart.id
    end
    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    lineItem_details["shopping_cart_id"] = @shopping_cart.id

    @line_item = LineItem.new lineItem_details

  end

  # GET /line_items/1/edit
  def edit
    # item_creator = Item.find_by(:id => params[:id])
    # unless @current_user && @current_user.id == item_creator.user_id
    #   redirect_to root_path
    # end
  end

  # POST /line_items
  # POST /line_items.json
  def create
    lineItem_details = line_item_params
   item = Item.find_by(:id => lineItem_details['item_id'])
    
    if ( !session[:shopping_cart_id]  || !ShoppingCart.find(session[:shopping_cart_id]).active )
      @shopping_cart = ShoppingCart.new(:user_id => @current_user.id, :active => true)
      @shopping_cart.save
      session[:shopping_cart_id] = @shopping_cart.id
    end

    @shopping_cart = ShoppingCart.find(session[:shopping_cart_id])
    lineItem_details["shopping_cart_id"] = @shopping_cart.id
    @seller_id = item.user_id 
    lineItem_details["seller_id"] = @seller_id


    @line_item = LineItem.new lineItem_details

    # Update cart
    @cart = ShoppingCart.find(session[:shopping_cart_id])
    # @cart.update :total_cost => lineItem_details['cost']
    # @cart.update :total_cost => @line_item.cost


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to shopping_cart_path(session[:shopping_cart_id]), notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:item_id, :shopping_cart_id, :quantity_purchased, :cost, :seller_id)
    end
end




