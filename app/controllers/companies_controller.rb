class CompaniesController < ApplicationController
  def index
    @companies = Company.all.order('name ASC')
    @trucks = Truck.all
    @hash = Truck.format_all_markers(@trucks)
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
    @hash = Truck.format_all_markers(@trucks)
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

  #I couldnt figure out the rails way of accessing different controllers in forms to perform ajax
  #Requests so I did this which I'm not proud of

  def create_comment
    company = Company.find(params[:id])
    @comment = company.comments.new(comment_params.merge(company: company))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to company_url, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: [company, @comment]}
        format.js   { render '/comments/create_comment'}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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
