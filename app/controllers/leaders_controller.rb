class LeadersController < ApplicationController
  before_action :find_category
  
  def index
    @leaders = Leader.published.order(position: :asc)
    @page[:title] = 'Ръководен екип'
    @page[:meta_description] = 'Лидерският екип на Загорка АД се грижи за успешното развитие на компанията и всички марки в нейното портфолио. Научете повече за ръководния екип тук.'
  end

  def show
    @leader  = Leader.friendly.find_by_slug params[:name_url]
    @leaders = Leader.published.where.not(id: @leader.id).page(params[:page]).per(4) 
  end

  private

  def find_category
    @category = Category.friendly.find 'kompaniyata'
    @articles = @category.static_pages
  end
end
