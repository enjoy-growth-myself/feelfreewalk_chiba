class PostarticlesController < ApplicationController
	def new
		@postarticle = Postarticle.new
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
	end

	def show
		@postarticle = Postarticle.find(params[:id])
	end

	def edit
	end

	def destroy
  	@postarticle = Postarticle.find(params[:id])
  	@postarticle.destroy
  	redirect_to postarticles_path, notice: "successfully delete book!"
  end
		
	def postarticle_params
    params.require(:postarticle).permit(:title, :body, :address,)
  end
end
