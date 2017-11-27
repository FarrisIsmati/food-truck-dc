class TrucksController < ApplicationController

  def new
    @truck = Truck.new
  end

  def create
    @company = Company.find(params[:id])
    @truck = Truck.create!(truck_params.merge(company: @company))
    redirect_to company_path(@company)
  end

  def show
    @truck = Truck.find(params[:id])
  end

  private
  def truck_params
    params.require(:truck).permit(:name)
  end
end
