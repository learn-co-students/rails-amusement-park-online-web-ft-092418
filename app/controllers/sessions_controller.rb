class SessionsController < ApplicationController
  def sign_in

  end

  def log_in
  #  binding.pry
    user= User.find_by(name: params[:user][:name])
    if user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to sign_in_path
    end
  end

  def sign_out
    session.clear
    redirect_to root_path
  end

end
