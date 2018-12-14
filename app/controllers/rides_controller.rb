class RidesController < ApplicationController

   def create
     @attraction = Attraction.find(params[:attraction_id])
     ride_the_ride if valid_ride?
     render "views/users/show"
   end

   private
    def valid_ride?
      #if height and tickets is greater than or equal  attraction and tickets
      @attraction.min_height < current_user.height && @attraction.tickets < current_user.tickets
    end

    def ride_the_ride
      user = current_user
      user.tickets -= @attraction.tickets
      user.save
    #  binding.pry
    end
end
