class SearchController < ApplicationController
  @@search_articles = 10
  def search
    if params[:keyword] == 'title'
      @postarticles = Postarticle.where('title LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(@@search_articles).reverse_order
    else
      @postarticles = Postarticle.where('address LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(@@search_articles).reverse_order
    end
  end
end
