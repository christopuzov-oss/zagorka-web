class StaticPagesController < ApplicationController
  before_action :find_category
  
  def show
    @article = StaticPage.friendly.find params[:slug]
    @page[:title] = @article.title
    @page[:description] = @article.meta_description
    @page[:keywords] = @article.meta_keywords
  end

  def brewing_process
    params[:category] = 'pivovarna'
    @page[:title] = 'Пивоварният процес'
    @page[:description] = 'Магията на доброто пиво се крие зад  многостепенен и интересен процес. Посетете тази страница, ако искате да разберете повече за стъпките на пивопроизводство.'
  end 


  private

  def find_category
    category = params[:category] || 'pivovarna'
    @category = Category.friendly.find category
    @articles = @category.static_pages.order(position: :asc)
  end
end
