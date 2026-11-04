class ProductsController < ApplicationController
  def index
    @products = Product.order(position: :asc)    
  end

  def show
    @product = Product.friendly.find_by_slug params[:id]

    @prev_product = Product.where('id<? ', @product.id).order(id: :desc).first
    @next_product = Product.where('id>?', @product.id).order(id: :asc).first
  end
end
