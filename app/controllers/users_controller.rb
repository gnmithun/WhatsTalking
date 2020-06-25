class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(whitelisted_user_params)
    @user.save
  end

  private
  def whitelisted_user_params
    params.require(:session).permit(:name,:password)
  end

end
