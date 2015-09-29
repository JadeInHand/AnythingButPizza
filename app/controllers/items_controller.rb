class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    unless @current_user && @current_user.admin?
        redirect_to root_path
    end
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find params[:id]

    # initializing an empty array
    @other_items = []
    @item.user.items.each do |current_item|
      # looping over all the other items that have the same user_id as the current item.
      unless current_item.id == @item.id
        @other_items << current_item
        # adding items that aren't the current item from the same chef into the array
      end
    end
  end

  # GET /items/new
  def new
    @category = Category.new
    @item = Item.new
    unless @current_user
      redirect_to root_path
    end

    if @current_user.address == ""
      # :alert => "Must have current address in order to create a new item."
      # :data => {:confirm => "Must have current address in order to create a new item"} 
      redirect_to edit_user_path(@current_user.id)
    end
  end

  # GET /items/1/edit
  def edit
    item_creator = Item.find_by(:id => params[:id])
    unless @current_user && @current_user.id == item_creator.user_id
      redirect_to root_path
    end
  end

  # POST /items
  # POST /items.json
  def create
    item_details = item_params

    if params[:file]
        response = Cloudinary::Uploader.upload params[:file]
        item_details["image"] = response["url"]
    end

    @item = Item.new(item_details)
    @item.user_id = @current_user.id

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    item_details = item_params
    @category = Category.new
    if params[:file]
        response = Cloudinary::Uploader.upload params[:file]
        item_details["image"] = response["url"]
    end

    respond_to do |format|
      if @item.update(item_details)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :servings, :cost, :description, :tags, :image, :file, :active, :user_id, :category_id)
    end
end
