class Admin::UsersController < ApplicationController
	def index
		@users = User.all.page(params[:page]).per(10).reverse_order
	end

	def show
		@user = User.find(params[:id])
		@postarticles = @user.postarticles.page(params[:page]).per(10).reverse_order
	end
end
