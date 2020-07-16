class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :only_current_user, only: [:update, :edit, :bookmarks]

	def index
		@users = User
		@user = current_user.all
	end

	def show
    	params_user = User.find(params[:id])
	    if current_user == params_user
	       @user = User.find(current_user.id)
	       @postarticles = @user.postarticles.page(params[:page]).per(10).reverse_order
	    else
	       @user = User.find(params[:id])
	       @postarticles = @user.postarticles.page(params[:page]).per(10).reverse_order
	    end
	end

	def create
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
	   # @book = Book.new
			 redirect_to(user_path(current_user.id), notice: "successfully updated user!")
		else
			render "edit"
		end
  	end

  	def bookmark
		@bookmark_postarticles = current_user.bookmark_postarticles.includes(:user)
	end

  	private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  #url直接防止メソッドを自己定義してbefore_actionで発動。
  def only_current_user
  	unless params[:id].to_i == current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end
