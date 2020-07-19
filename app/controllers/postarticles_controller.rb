class PostarticlesController < ApplicationController
	before_action :authenticate_user!, except: :index
	before_action :only_current_user_postarticle, only: [:update, :edit]
	def new
		#投稿記事と画像のnewの2つを用意
		@postarticle = Postarticle.new
		@postarticle.postarticle_images.build
	end

	def create
		@postarticle = Postarticle.new(postarticle_params)
		@postarticle.user_id = current_user.id
    	if @postarticle.save
      		redirect_to postarticle_path(@postarticle.id), notice: '新規投稿に成功しました'
    	else
	    	render :new
    	end
	end

	def index
		@postarticles = Postarticle.page(params[:page]).per(3).reverse_order
	end

	def show
		@postarticle = Postarticle.find(params[:id])
		@postarticle_image = PostarticleImage.new
		@max_image = $image_par_article
		@postarticle_comment = PostarticleComment.new
		#binding.pry
		@total_score = @postarticle_comment.total_score(@postarticle.id)
	end

	def edit
		@postarticle = Postarticle.find(params[:id])
	end

	def update
		@postarticle = Postarticle.find(params[:id])
		@postarticle.update(postarticle_params)
		redirect_to postarticle_path(@postarticle), notice: '投稿記事の更新に成功しました'
	end

	def destroy
	  	@postarticle = Postarticle.find(params[:id])
	  	@postarticle.destroy
	  	redirect_to postarticles_path, notice: "投稿記事の削除に成功しました"
  	end

	

	private
	def postarticle_params
    	params.require(:postarticle).permit(:title, :body, :address, :user_id,:latitude,:longitude, postarticle_images_images: [])
  	end

  	def only_current_user_postarticle
  		postarticle = Postarticle.find(params[:id])
  		unless
  			postarticle.user_id == current_user.id
	  		redirect_to user_path(current_user)
	  	end
	end
end
