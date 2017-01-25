class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'Dylan', password: 'Valdez',
                               except: [:index, :show]
  def index
    @articles = Article.all
  end
  def show
    @article = Article.find(params[:id])
#guarda en la variable los datos de la clase "Article" segun su [:id]
  end
  def new
    @article = Article.new
  end
  def edit
    @article = Article.find(params[:id])
  end
  def create
    @article = Article.new(article_params)
#Crea un nuevo elemento de la clase "Article" y llama la funcion "article_params"
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
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end
  private
  def article_params
    params.require(:article).permit(:title, :text)
#de la tabla ":article" da permisos para guardar los parametros ':title' y ':text' unicamente
  end
end
