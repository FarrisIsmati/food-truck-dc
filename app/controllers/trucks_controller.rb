class TrucksController < ApplicationController
  def destroy
    company = Company.find(params[:company_id])
    truck = Truck.find(params[:id])
    truck.destroy

    redirect_to company_path(company)
  end
end
