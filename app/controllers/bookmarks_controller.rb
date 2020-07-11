class BookmarksController < ApplicationController
	

	def create
		@postarticle = Postarticle.find(params[:postarticle_id])
		@bookmark = Bookmark.new
		@bookmark.user_id = current_user.id
		@bookmark.postarticle_id = @postarticle.id
		@bookmark.save

		#redirect_back(fallback_location: root_path)
	end

	def destroy
		@postarticle = Postarticle.find(params[:postarticle_id])
		@bookmark = current_user.bookmarks.find_by(postarticle_id: @postarticle.id)
		@bookmark.destroy

		#redirect_back(fallback_location: root_path)
	end
end
