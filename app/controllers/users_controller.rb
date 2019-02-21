class UsersController < ApplicationController
  #before_action :logged_in?, only: :show
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id 
    redirect_to user_path(user)
  end

  def signin
    #@user = User.new
    @users = User.all
  end

  def login
    user = User.find_by(name: params[:user][:name])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_path
    end
  end

  def show
    redirect_to root_path unless logged_in?
    @user = User.find(params[:id])
    
  end

  def logout
    session.clear
    redirect_to root_path
  end

  

  private
    def user_params
      params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :admin, :password)
    end
end
