class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    property = Property.create!(
      params.require(:property).permit(
        :title, :description, :rooms, :bathrooms, :pets,
        :parking_slot, :daily_rate, :property_type_id, :property_location_id
      )
    )
    redirect_to property
  end
end
