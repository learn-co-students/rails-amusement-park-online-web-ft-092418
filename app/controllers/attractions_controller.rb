class AttractionsController < ApplicationController
  include ApplicationHelper
before_action :set_attraction , only: [:show , :edit , :update]

def index
  @attractions = Attraction.all
end

def show

end


def new
  if current_user.admin
  @attraction = Attraction.new
else
  redirect_to attractions_path
end
end

def create
  @attraction = Attraction.new(attraction_params)

  if @attraction.save
    redirect_to attraction_path(@attraction)
  else
    redirect_to new_attraction_path
  end

end


def edit

end


def update

if current_user.admin
  @attraction.update(attraction_params)
  redirect_to attraction_path(@attraction)
else
  redirect_to attractions_path
end

end

private

def set_attraction
  @attraction = Attraction.find(params[:id])
end

def attraction_params
  params.require(:attraction).permit(:name , :min_height , :happiness_rating , :nausea_rating , :tickets)
end

end
