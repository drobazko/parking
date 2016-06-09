class ParkingController < ApplicationController
  def index
  end

  def fill
    session[:parking] = ParkingHandler.new(
        sedan_number: params[:sedan_number].to_i, 
        disabled_number: params[:disabled_number].to_i, 
        truck_number: params[:truck_number].to_i
      )
    @parking = session[:parking]
  end

end
