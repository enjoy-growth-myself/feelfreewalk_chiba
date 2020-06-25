class PostarticleImagesController < ApplicationController
	def edit
		@postarticle_image = PostarticleImage.find(params[:id])
	end

	def update
		@postarticle_image = PostarticleImage.find(params[:id])
		@postarticle_image.update(image_params)
		redirect_to postarticles_path
	end

	private

  def image_params
  	params.require(:postarticle_image).permit(:image)
  end
end
