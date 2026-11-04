class SearchController < ApplicationController
  def index
    @query = params[:query]
    articles =
      Product.search(@query).to_a +
      StaticPage.search(@query).to_a +
      Article.search(@query).to_a 
    articles.flatten!

    @results = Kaminari.paginate_array(articles).page(params[:page]).per(2)
  end
end
