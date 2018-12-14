class RidesController < ApplicationController

   def create
     @attraction = Attraction.find(params[:attraction_id])
     ride_the_ride if valid_ride?
     redirect_to user_path(current_user)
   end

   private
    def valid_ride?
      #if height and tickets is greater than or equal  attraction and tickets
      @attraction.min_height < current_user.height && @attraction.tickets < current_user.tickets
    end

    def ride_the_ride
      current_user.tickets -= @attraction.tickets
      current_user.save
      binding.pry
    end
end
