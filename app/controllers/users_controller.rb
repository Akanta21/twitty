class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, except: [:new]
  before_action :edit_user, only: [:edit, :update]
  before_action :del_user, only: [:destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.where(name: params[:name]) unless params[:name].blank?
    if @users.blank?
      @users = User.all
    # redirect_to new_customer_path, notice: "customer #{params[:name]} not found. Add them?"
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    # @orders = Order.where(customer_id: @customer.id)
    # @customer = Customer.find_by(name: params[:id])
    redirect_to users_path if @user.blank?
  end

  # GET /users/new
  def new
    @user = User.new
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
        format.html { redirect_to login_path, notice: 'User was succesfully created' }
        format.json { render :show, status: :created, location: login_path }
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
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def edit_user
      if @user.email != current_user.email
        flash[:error] = "You're not allowed to edit other users account!"
        redirect_to users_url
      end
    end

    def del_user
      if @user.email != "a.kanta22@gmail.com"
        flash[:error] = "You're not allowed to delete user! Please contact admin!"
        redirect_to home_url
      end
    end
end
