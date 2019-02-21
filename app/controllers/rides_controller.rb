class RidesController < ApplicationController

   def create
     @attraction = Attraction.find(params[:attraction_id])
     ride_the_ride if valid_ride?
     @user = current_user
     redirect_to user_path(current_user)
   end

   private
    def valid_ride?
      if @attraction.min_height > current_user.height && @attraction.tickets > current_user.tickets
        flash[:message] = "You are not tall enough to ride the #{@attraction.name} You do not have enough tickets to ride the #{@attraction.name}"
        false
      elsif @attraction.tickets > current_user.tickets
        flash[:message] = "You do not have enough tickets to ride the #{@attraction.name}"
        false
      elsif @attraction.min_height > current_user.height
        flash[:message] = "You are not tall enough to ride the #{@attraction.name}"
        false
      else
        true
      end
    end

    def ride_the_ride
      user = current_user
      user.nausea += @attraction.nausea_rating
      user.happiness += @attraction.happiness_rating
      user.tickets -= @attraction.tickets
      user.save
      flash[:message] = "Thanks for riding the #{@attraction.name}!"
    #  binding.pry
    end
end
