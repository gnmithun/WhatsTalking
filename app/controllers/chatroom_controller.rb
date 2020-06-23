class ChatroomController < ApplicationController
  
  def index
    redirect_to login_path if !logged_in?
    @message = Message.create
    @messages = Message.custom_display    
  end
  
end
