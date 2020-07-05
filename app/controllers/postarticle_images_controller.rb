class PostarticleImagesController < ApplicationController
	# 画像のみの編集、アップデート、削除はこのコントローラーで行う
	def edit
		@postarticle_image = PostarticleImage.find(params[:id])
	end

	def update
		@postarticle_image = PostarticleImage.find(params[:id])
		@postarticle_image.update(image_params)
		redirect_to postarticle_path(@postarticle_image.postarticle)
	end

	def create
		@postarticle = Postarticle.find(params[:postarticle_id])
		@postarticle_image = PostarticleImage.new(image_params)
		@postarticle_image.postarticle_id = @postarticle.id
		@postarticle_image.save
		redirect_to postarticle_path(@postarticle)
	end

	def destroy
	  	postarticle_image = PostarticleImage.find(params[:id])
	  	postarticle_image.destroy
	  	redirect_back(fallback_location: root_path)
  	end

	private

  def image_params
  	params.require(:postarticle_image).permit(:image)
  end
end
