class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    return redirect_to :root unless logged_in?
    @user = current_user
  #  @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def signin
    @user = User.new
  end

  def logout
    session.destroy
    redirect_to :root
  end

  def login
    user = User.find_by_name(user_params[:name])
    return redirect_to "/signin" unless user.authenticate(user_params[:password])
    session[:user_id] = user.id
    redirect_to user_path(user)
  end


  def welcome

  end

  private

    def user_params
      params.require(:user).permit(:id, :name, :nausea, :happiness, :tickets, :height, :password, :admin)
    end
end
