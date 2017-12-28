class ReviewsController < ApplicationController
before_action :authenticate_user!, except: [:show]
   load_and_authorize_resource
  def create
    @review=Review.new(review_params)
    @review.user_id=current_user.id
    if @review.save
    redirect_to articles_path(@review.article_id), notice: "Your Comment Has Been Added"
  end
end

def destroy
  @review=Review.find(params[:id])
  @review.destroy
  redirect_to articles_path
end

def edit
  @review=Review.find(params[:id])
end

def update
  @review=Review.find(params[:id])
  if @review.update_attributes(review_params)
    redirect_to articles_path
  end

end



  private
  def review_params
    params[:review].permit(:body, :article_id)
end
end
