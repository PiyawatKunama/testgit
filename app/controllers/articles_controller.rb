class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end


  def create
    ap '=' * 30
   ap current_user
   ap '=' * 30

    @article = current_user.articles.create(article_params)

   ap @article
   ap '*'*30

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
   
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end


  def index
    @articles = current_user.articles
  end

    
  def show
    @article = Article.find(params[:id])
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy
   
    redirect_to(articles_path)
  end
    
  private
  
  def article_params  
    params.require(:article).permit(:title, :text, :verify,:first_name,:last_name,:email)
  end
end
