class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if user_params[:password]
      user = User.create(user_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def welcome

  end

  private

  def user_params
    params.require(:user).permit(:name, :happiness, :tickets, :height, :nausea, :password, :admin)
  end
end
