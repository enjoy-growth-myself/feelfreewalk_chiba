class Admin::UsersController < ApplicationController
	def index
		@users = User.all.page(params[:page]).per(10).reverse_order
	end

	def show
		@user = User.find(params[:id])
		@postarticles = @user.postarticles.page(params[:page]).per(10).reverse_order
	end

	def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice] = "更新されました!"
    else
      render :edit
    end
  end

  private
  def user_params
  	params.require(:user).permit(:is_valid)
  end
end
