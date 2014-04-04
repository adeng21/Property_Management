class BuildingsController < ApplicationController

  def index



  end


  def new
    @building = Building.new

  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to root_path,
      notice: "New Building Successfully Created!"
    else
      render new

    end
  end







  protected

  def building_params
    params.require(:building).permit(:street_address, :city, :state, :postal_code, :description)

  end

end
