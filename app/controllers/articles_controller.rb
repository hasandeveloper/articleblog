class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
     load_and_authorize_resource :find_by => :slug
  def show
     @model = Article.find params[:id]
   end




  def index
  @articles=Article.all
end

def new
  @articles=Article.new

end

def create
  @articles=Article.new(article_params)
  @articles.user_id=current_user.id
  if @articles.publish_date<=Date.today
    @articles.is_published=true
  else
    @articles.is_published=false
  end
  if @articles.save
    redirect_to articles_path, notice: "Article was Succesfully Created"
  else
    render action: 'new'
  end
end
def show
  @articles=Article.friendly.find(params[:id])

  @review=Review.new
end

def edit
  @articles=Article.friendly.find(params[:id])
end

def destroy
  @articles=Article.friendly.find(params[:id])
  @articles.destroy
  redirect_to articles_path notice: "Article was Succesfully Deleted"
end

def update
  @articles=Article.friendly.find(params[:id])
  @articles.update_attributes(article_params)
  redirect_to articles_path notice: "Article was Succesfully Updated"
end

private

def article_params
  params[:article].permit(:title, :body, :category_id, :publish_date, :cover, :is_published, :article_id)
end

end
