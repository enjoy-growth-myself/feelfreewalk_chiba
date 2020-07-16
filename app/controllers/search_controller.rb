class SearchController < ApplicationController
	def search
		if params[:keyword] == "title"
			@postarticles = Postarticle.where('title LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
		else
			@postarticles = Postarticle.where('address LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
		end
	end
end