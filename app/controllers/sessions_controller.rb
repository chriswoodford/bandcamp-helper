class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:username])
    if user && user.authenticate(params[:password])
      login user
      redirect_back_or user
    else
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
  
end
