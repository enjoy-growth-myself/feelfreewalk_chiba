class PostarticlesController < ApplicationController
	def new
		@postarticle = Postarticle.new
		@postarticle.postarticle_images.build
	end

	def create
		@postarticle = Postarticle.new(postarticle_params)
		@postarticle.user_id = current_user.id
    	if @postarticle.save
      		redirect_to postarticle_path(@postarticle.id), notice: '新規投稿に成功しました'
    	else
	    	@postarticle = Postarticle.new
	    	render :index
    	end
	end

	def index
		@postarticles = Postarticle.all
	end

	def show
		@postarticle = Postarticle.find(params[:id])
		@postarticle_image = PostarticleImage.new
	end

	def edit
		@postarticle = Postarticle.find(params[:id])
	end

	def update
		@postarticle = Postarticle.find(params[:id])
		@postarticle.update(postarticle_params)
		redirect_to postarticle_path(@postarticle), notice: '更新に成功しました'
	end

	def destroy
	  	@postarticle = Postarticle.find(params[:id])
	  	@postarticle.destroy
	  	redirect_to postarticles_path, notice: "画像の削除に成功しました"
  	end
		
	private
	def postarticle_params
    	params.require(:postarticle).permit(:title, :body, :address, :user_id, postarticle_images_attributes: [:image])
  	end
end
