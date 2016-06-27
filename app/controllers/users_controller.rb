class UsersController < ApplicationController
  # before_action :require_login, except: [:new, :create]
  # before_action :require_correct_user, only: [:show, :edit, :update, :destroy]  

  def index
  end

  def new
  end

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:account_created] = "Account has been successfuly  created!"
      redirect_to "/users/index"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/users/index"
    end
  end
  
  private
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end
end
