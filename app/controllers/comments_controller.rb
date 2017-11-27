class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    company = Company.find(params[:company_id])
    @comment = Commment.create!(comment_params.merge(user: company))
    redirect_to company_path(@company)
  end

  private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
