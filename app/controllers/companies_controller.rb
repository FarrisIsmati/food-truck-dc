class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order('name ASC')
    @trucks = Truck.all
    @hash = []
    @trucks.each do |truck|
      @hash.push({
        "lat" => truck.latitude,
        "lng" => truck.longitude,
        "infowindow" => Company.find(truck.company_id).name,
        "company" => Company.find(truck.company_id).id,
        "truck" => truck[:id]
      })
    end
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(company_params.merge(user: current_user))
    redirect_to company_path(@company)
  end

  def show
    @company = Company.find(params[:id])
    @comments = @company.comments
    @trucks = @company.trucks
    @hash = []
    @trucks.each do |truck|
      @hash.push({
        "lat" => truck.latitude,
        "lng" => truck.longitude,
        "infowindow" => Company.find(truck.company_id).name,
        "company" => Company.find(truck.company_id).id,
        "truck" => truck[:id]
      })
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    redirect_to companies_path
  end

  def create_comment
    company = Company.find(params[:id])
    @comment = company.comments.create!(comment_params.merge(company: company))
    respond_to do |format|
      format.js { render '/comments/create_comment'}
    end
  end

  def create_truck
    @company = Company.find(params[:id])
    @truck = Truck.create!(truck_params.merge(company: @company))

    @location = {
      :latitude => @truck.latitude,
      :longitude => @truck.longitude,
      :infowindow => Company.find(@truck.company_id).name
    }
    require 'json'
    @json = @location.to_json
    respond_to do |format|
      format.js { render '/trucks/create_truck'}
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :website, :profile_img, :phone_number, :bio)
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end

  def truck_params
    params.require(:truck).permit(:name, :address)
  end
end
