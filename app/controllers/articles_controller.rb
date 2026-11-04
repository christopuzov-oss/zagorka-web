class ArticlesController < ApplicationController

  def index
    @articles = Article.published.order(featured: :desc, publish_at: :desc).page(params[:page]).per(8)
  end

  def show
    @article = Article.friendly.find_by_slug params[:id]
    @articles = Article.where.not(id: @article.id).order(featured: :desc, publish_at: :desc).page(params[:page]).per(4) 
  end
end
