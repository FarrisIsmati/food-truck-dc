class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    #https://www.youtube.com/watch?v=Z5W-Y3aROVE UPLOAD IMG DATA
    @company = Company.create!(company_params.merge(user: current_user))
    redirect_to company_path(@company)
  end

  def show
    @company = Company.find(params[:id])
    @comments = @company.comments
    @trucks = @company.trucks
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    respond_to do |format|
      format.html {redirect_to company_path(@company)}
      format.js
    end
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
      format.js { render 'create_comment'}
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :website, :profile_img, :phone_number, :bio)
  end

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
