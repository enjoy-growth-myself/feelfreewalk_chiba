class PostarticleCommentsController < ApplicationController
	#コメントはAjax使用
	def create
		@postarticle = Postarticle.find(params[:postarticle_id])
		@comment = PostarticleComment.new(postarticle_comment_params)
		@comment.user_id = current_user.id
		@comment.postarticle_id = @postarticle.id
		if @comment.save
		   @postarticle = Postarticle.find(@postarticle.id)
		else
		   @postarticle = Postarticle.find(@postarticle.id)
		   @postarticle_image = PostarticleImage.new
		   @postarticle_comment = PostarticleComment.new
		   @max_image = $image_par_article
		   render "postarticles/show"
		end
	end

	def destroy
		@postarticle = Postarticle.find(params[:postarticle_id])
		@comment = @postarticle.postarticle_comments.find(params[:id])
		@comment.destroy
	end

	private
	def postarticle_comment_params
		params.require(:postarticle_comment).permit(:comment,:user_id,:postarticle_id)
	end
end
