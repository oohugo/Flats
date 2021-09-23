class PropertyTypesController < ApplicationController
  def new
    @p_type = PropertyType.new
  end

  def create
    PropertyType.create(params.require(:property_type).permit(:name))
    redirect_to root_path
  end
end
