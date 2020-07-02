class SearchController < ApplicationController
	def desrch
		@postarticles = Postarticle.where('name LIKE ?', "%#{params[:title]}%")
        @user = current_user
	end
end
