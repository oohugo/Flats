class PropertiesController < ApplicationController
  before_action :authenticate_property_owner!, only: [:create, :new]
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(
      params.require(:property).permit(
        :title, :description, :rooms, :bathrooms, :pets,
        :parking_slot, :daily_rate, :property_type_id, :property_location_id
      )
    )
    @property.property_owner = current_property_owner
    if @property.save
      redirect_to @property
    else
      render action: 'new'
    end
  end

  def my_properties
    @properties = current_property_owner.properties
  end
end
