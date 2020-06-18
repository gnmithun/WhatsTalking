class ChatroomController < ApplicationController
  
  def index
    @messages = Message.all()
    redirect_to login_path if !logged_in?
  end
  
end
