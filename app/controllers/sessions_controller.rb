class SessionsController < ApplicationController

  before_action :logged_in_redirect, only:[:new, :create]

  def new

  end
  
  def create
    user = User.find_by(name:params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.name} !!!"
      redirect_to root_path
    else
      flash.now[:error] = "Log in failed: Check your credentials"
      render 'new'
    end
  end


  def destroy

    user = User.find(session[:user_id]) if session[:user_id]
    session[:user_id] = nil
    flash[:success] = "Bye #{user.name}. See you soon!!!"
    redirect_to login_path
  end

  private
  def logged_in_redirect
    if logged_in?
      user = User.find(session[:user_id]) if session[:user_id]
      flash[:error] = "You are already logged in #{user.name}"
      redirect_to root_path
    end
  end
end
