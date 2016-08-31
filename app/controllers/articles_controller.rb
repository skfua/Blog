class ArticlesController < ApplicationController

  include Miro
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    @user = User.find(current_user.id)
    @article = @user.articles.new(article_params)
    @article.user_id = current_user.id

    if @article.valid?
      @article.save
      redirect_to @article
    else
      @error = @article.errors.full_messages
      render action: "new"
    end
  end

  def show
    @article = Article.find(params[:id])
    @user = User.find(@article.user_id)
    @colors = Miro::DominantColors.new('http://localhost:3000' + @article.image.thumb.url)
  end

  def edit
    @article = Article.find(params[:id])
    if current_user.id == @article.user_id
      render 'edit'
    else
      redirect_to root_path
      flash[:danger] = 'You havent access to edit this article'
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
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to articles_path
    else
     redirect_to articles_path
    end

  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :fabula, :user_id, :image)
  end

end
