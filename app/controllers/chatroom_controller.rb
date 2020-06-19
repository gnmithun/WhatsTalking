class ChatroomController < ApplicationController
  
  def index
    redirect_to login_path if !logged_in?
    @messages = Message.all()    
  end
  
end
