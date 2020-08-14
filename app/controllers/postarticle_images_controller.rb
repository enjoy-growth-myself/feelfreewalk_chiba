class PostarticleImagesController < ApplicationController
  # 画像のみの編集、アップデート、削除はこのコントローラーで行う
  before_action :authenticate_user!
  before_action :only_current_user_image, only: %i[edit destroy update]
  before_action :only_current_user_postarticle, only: [:create]
  def edit
    @postarticle_image = PostarticleImage.find(params[:id])
  end

  def update
    @postarticle_image = PostarticleImage.find(params[:id])
    @postarticle_image.update(image_params)
    redirect_to postarticle_path(@postarticle_image.postarticle), notice: '画像の更新に成功しました'
  end

  def create
    @postarticle = Postarticle.find(params[:postarticle_id])
    @postarticle_image = PostarticleImage.new(image_params)
    @postarticle_image.postarticle_id = @postarticle.id
    @postarticle_image.save
    redirect_to postarticle_path(@postarticle), notice: '画像の投稿に成功しました'
  end

  def destroy
    postarticle_image = PostarticleImage.find(params[:id])
    postarticle_image.destroy
    redirect_back(fallback_location: root_path, notice: '画像の削除に成功しました')
    end

  private

  def image_params
    params.require(:postarticle_image).permit(:image)
  end

  def only_current_user_image
    image = PostarticleImage.find(params[:id])
    redirect_to user_path(current_user) unless image.postarticle.user_id == current_user.id
   end

  def only_current_user_postarticle
    postarticle = Postarticle.find(params[:postarticle_id])
    redirect_to user_path(current_user) unless postarticle.user_id == current_user.id
  end
end
