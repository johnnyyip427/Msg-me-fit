class UserController < ApplicationController

	def index
		@user = User.all
	end

	def show
		@user = User.find(session[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:id] = @user.id
			redirect_to '/'
		else
			render 'new'
		end
	end

	  private

  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
