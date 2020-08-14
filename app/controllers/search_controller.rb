class SearchController < ApplicationController
	# def search
	# 	if params[:keyword] == "title"
	# 		@postarticles = Postarticle.where('title LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
	# 	else
	# 		@postarticles = Postarticle.where('address LIKE ?', "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
	# 	end
	# end

	def search
		search_colums = params[:keyword] == "title"? 'title LIKE ?':'address LIKE ?'
		@postarticles = Postarticle.where(search_colums, "%#{params[:searchword]}%").page(params[:page]).per(10).reverse_order
	end
end
