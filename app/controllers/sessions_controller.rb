class SessionsController < ApplicationController
  # before_action :require_login, except: [:new, :create]
	def new	
	end

	def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"

    else
      flash[:errors] = ["Invalid combination"]
      redirect_to '/users/index'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
