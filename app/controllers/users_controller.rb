class UsersController < ApplicationController
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the theme park!"
      #binding.pry
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end

  end

  def show
    @user = User.find_by_id(params[:id])
    redirect_to root_path if !is_signed_in?
  end


  private
  def user_params
    params.require(:user).permit(:name , :tickets , :nausea , :happiness , :height , :admin , :password)
  end

end
