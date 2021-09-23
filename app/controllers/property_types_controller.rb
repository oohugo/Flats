class PropertyTypesController < ApplicationController
  def new
    @p_type = PropertyType.new
  end

  def create
    @p_t = PropertyType.new(params.require(:property_type).permit(:name))
    if @p_t.valid?
      @p_t.save
      redirect_to root_path
    else
      flash.now[:alert] = @p_t.errors.messages
      render action: 'new'
    end
  end
end
