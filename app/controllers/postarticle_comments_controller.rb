class PostarticleCommentsController < ApplicationController

	def create
		@postarticle = Postarticle.find(params[:postarticle_id])
		@comment = PostarticleComment.new(postarticle_comment_params)
		@comment.user_id = current_user.id
		@comment.postarticle_id = @postarticle.id
		if @comment.save
		   @user = User.find(@postarticle.user_id)
		   redirect_to(postarticle_path(@postarticle),notice: "コメントの投稿に成功しました")
		else
		   @user = User.find(@book.user_id)
		   @postarticle = Postarticle.find(@postarticle.id)
		   @book_comment = PostarticleComment.new
		   render postarticle_path
		end
	end

	def destroy
		@postarticle = Postarticle.find(params[:postarticle_id])
		@comment = @postarticle.postarticle_comments.find(params[:id])
		@comment.destroy
		redirect_to(postarticle_path(@postarticle.id),notice: "コメントの削除に成功しました")
	end

	private
	def postarticle_comment_params
		params.require(:postarticle_comment).permit(:comment,:user_id,:postarticle_id)
	end
end
