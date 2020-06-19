class SessionsController < ApplicationController

  def new

  end
  
  def create
    user = User.find_by(name:params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Log in failed: Check your credentials"
      render 'new'
    end
  end


  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to login_path
  end

end
