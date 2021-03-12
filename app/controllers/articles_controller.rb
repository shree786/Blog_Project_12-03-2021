class ArticlesController < ApplicationController
  def index
    if params[:query]
      @articles = Article.where("body LIKE ?", "%#{params[:query]}%")
    else
      @articles = Article.all
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(create_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to article_path(@article)
  end


  private
  def create_params
    params.require(:article).permit(:title, :body)
  end
end
