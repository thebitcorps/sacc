class LocationInformationController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  before_filter :set_location, only: [:update]

  def index

  end

  def update
    if @location.update location_params
      render json: @location.as_json
    else
      render json: @location.errors , status: :unprocessable_entity
    end
  end

private
  def set_location
    @location = LocationInformation.find params[:id]
  end

  def location_params
    params.require(:location_information).permit(:pattern, :interior, :sale_price, :land, :final_sale_price, :lot, :excess, :over_cost, :promo, :final_sale_price)
  end
end
