class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    # if @location.options.include?()
    #
    # end
  end


end
