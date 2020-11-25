class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def new
    @article = current_user.articles.new
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end


  def create
  

    @article = current_user.articles.create(article_params)


    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = current_user.articles.find(params[:id])
   
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
    @article = current_user.articles.find(params[:id])
  end


  def destroy
    @article = current_user.articles.find(params[:id])
    @article.destroy
   
    redirect_to(articles_path)
  end
    
  private
  
  def article_params  
    params.require(:article).permit(:title, :text, :verify,:first_name,:last_name,:email)
   
  end
end
