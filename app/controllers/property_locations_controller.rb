class PropertyLocationsController < ApplicationController
  def new
    @location = PropertyLocation.new
  end

  def create
    @location = PropertyLocation.new(params.require(:property_location).permit(:name))
    if @location.save
      redirect_to root_path
    else
      flash.now[:alert] = @location.errors.messages
      render action: 'new'
    end
  end

  def show
    @property_location = PropertyLocation.find(params[:id])
  end
end
