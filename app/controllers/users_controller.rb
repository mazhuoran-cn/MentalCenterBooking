class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = type_class.paginate(page: params[:page], per_page: 30)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = type_class.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to @user, notice: "#{type} was successfully created." }
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "#{type} was successfully updated." }
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
    params.require(type.underscore.to_sym).permit(:name, :email, :type, :password, :password_confirmation, :school_id)
  end

  #private
  #
  def set_type
    @type = type
  end

  def type
    User.types.include?(params[:type]) ? params[:type] : 'User'
  end

  def type_class
    type.constantize
  end

  def logged_in_user
    unless logged_in?
      store_location
      respond_to do |format|
        format.html { redirect_to login_url, alert: "Please log in." }
      end
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user)
      redirect_to root_url
    end
  end

end
