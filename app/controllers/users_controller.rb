class UsersController < ApplicationController 
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def show
        if logged_in?
            @user = current_user
        else 
            redirect_to root_path
        end
    end

    def login
        @user = User.find_by(name: user_params[:name])

        if @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to "/signin"
        end
    end

    def logout
        session.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:id, :name, :password, :height, :nausea, :happiness, :tickets, :admin)
    end
end