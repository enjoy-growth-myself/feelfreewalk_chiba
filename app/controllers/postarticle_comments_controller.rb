class PostarticleCommentsController < ApplicationController
  # コメントはAjax使用
  def create
    @postarticle = Postarticle.find(params[:postarticle_id])
    @comment = PostarticleComment.new(postarticle_comment_params)
    @comment.user_id = current_user.id
    @comment.score = Language.get_data(postarticle_comment_params[:comment])
    @comment.postarticle_id = @postarticle.id
    @postarticle = Postarticle.find(@postarticle.id)
    @postarticle_comment = PostarticleComment.new
    # おすすめの★をAJaxで更新するために記述
    if @comment.save
      @total_score = @postarticle_comment.total_score(@postarticle.id)
    else
      @postarticle_image = PostarticleImage.new
      @max_image = $image_par_article
      render 'postarticles/show'
    end
  end

  def destroy
    @postarticle = Postarticle.find(params[:postarticle_id])
    @comment = @postarticle.postarticle_comments.find(params[:id])
    @comment.destroy
    @postarticle_comment = PostarticleComment.new
    @total_score = @postarticle_comment.total_score(@postarticle.id)
  end

  private

  def postarticle_comment_params
    params.require(:postarticle_comment).permit(:comment, :user_id, :postarticle_id)
  end
end
