class BookmarksController < ApplicationController
  # お気に入り登録、削除はAjaxを使用
  def create
    @postarticle = Postarticle.find(params[:postarticle_id])
    @bookmark = Bookmark.new
    @bookmark.user_id = current_user.id
    @bookmark.postarticle_id = @postarticle.id
    @bookmark.save
  end

  def destroy
    @postarticle = Postarticle.find(params[:postarticle_id])
    @bookmark = current_user.bookmarks.find_by(postarticle_id: @postarticle.id)
    @bookmark.destroy
  end
end
