class UsersController < ApplicationController
  before_action :authenticate
  before_action :load_user, except: [:new, :index, :create]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def new
    if session[:user_hash]  
      @user = User.new_from_hash session[:user_hash]
      @user.valid?
    else
      @user = User.new
    end
  end

  def create
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.name = user_params[:name]
      @user.email = user_params[:email]      
    else
      @user = User.new user_params
    end
    if @user.save
      login(@user)
      session[:user_hash] = nil
      redirect_to root_path, notice: "You are successfully signed up."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if User.find(id=params[:id]).update user_params
      redirect_to users_path, notice: "User was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(id=params[:id]).destroy
    redirect_to users_path, alert: "User was deleted."
  end

  private

  def load_user
    @user =User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
