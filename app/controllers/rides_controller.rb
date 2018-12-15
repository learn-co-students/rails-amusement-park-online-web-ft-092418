class RidesController < ApplicationController
  include ApplicationHelper
  def new

  end

  def create
    @ride = Ride.new(ride_params)
    @ride.save
    if @ride.take_ride.class == String
      flash[:alert] = @ride.take_ride
      session[:message ] = @ride.take_ride
    else
      flash[:alert] = "Thanks for riding the #{@ride.attraction.name}!"
      session[:message ] = "Thanks for riding the #{@ride.attraction.name}!"
    end
    redirect_to user_path(current_user)
  end

private

def ride_params
  params.require(:ride).permit(:attraction_id , :user_id)
end

end
