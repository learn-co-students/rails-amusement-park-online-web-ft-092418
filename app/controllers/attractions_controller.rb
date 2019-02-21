class AttractionsController < ApplicationController 
    before_action :set_attraction, only: [:edit, :show, :update]
    before_action :set_user, except: [:new, :create]

    def index
        @attractions = Attraction.all
    end

    def new 
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def show
    end

    def edit
    end 

    def update
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def ride 
        flash[:message] = Ride.create(user_id: params[:user_id], attraction_id: params[:attraction_id]).take_ride
        redirect_to user_path(@user) 
    end

    private 

    def attraction_params
        params.require(:attraction).permit(:name, :min_height, :nausea_rating, :happiness_rating, :tickets)
    end

    def set_attraction
        @attraction = Attraction.find(params[:id])
    end

    def set_user
        @user = current_user
    end
end