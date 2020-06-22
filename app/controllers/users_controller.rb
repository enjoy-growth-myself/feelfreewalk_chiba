class UsersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end

	def show
    	params_user = User.find(params[:id])
	    if current_user == params_user
	       @user = User.find(current_user.id)
	    else
	       @user = User.find(params[:id])
	    end
	end

	def create
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	end
end
