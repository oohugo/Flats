class PropertyTypesController < ApplicationController
  def new
    @property_type = PropertyType.new
  end

  def create
    @property_type = PropertyType.new(params.require(:property_type).permit(:name))
    if @property_type.save
      redirect_to root_path
    else
      # flash.now[:alert] = @p_t.errors.messages
      render action: 'new'
    end
  end
end
