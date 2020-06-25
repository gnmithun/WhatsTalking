class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save      
      flash[:success] = "Welcome #{@user.name}! "      
      session[:user_id] = @user.id            
      redirect_to root_path
    else
      flash.now[:error] = "Sorry #{@user.name}! Sign up failed, because #{@user.errors.messages}"
      render 'new'
    end
  end

  private
  def whitelisted_user_params
    params.require(:user).permit(:name,:password)
  end

end
