class Admin::UsersController < ApplicationController
	def index
		@users = User.all.page(params[:page]).per(10).reverse_order
	end
end
