class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    unless @current_user.admin?
      redirect_to user_path(@current_user.id)
    else
      @users = User.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @yums_by_me = Item.where(:user_id => params[:id])
    @yums_eaten = LineItem.where(:shopping_cart_id => (ShoppingCart.where(:user_id => @current_user.id)))
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    unless @current_user.id.to_s == params[:id]
      redirect_to edit_user_path(@current_user.id)
    end
  end

  # POST /users
  # POST /users.json
  def create
    user_details = user_params 
    # Using cloudinary to upload user profile pics
    if params[:file]
        response = Cloudinary::Uploader.upload params[:file]
        user_details["image"] = response["url"]
    end 
    @user = User.new user_details

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = @current_user
    user_details = user_params
    binding.pry
    if params[:file]
        response = Cloudinary::Uploader.upload params[:file]
        user_details["image"] = response["url"]
    end
 
    respond_to do |format|
      if @user.update(user_details)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :address, :latitude, :longitude, :postcode, :image, :file, :password, :password_confirmation)
    end
end
