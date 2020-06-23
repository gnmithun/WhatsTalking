class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(whitelisted_messages)
    ActionCable.server.broadcast "ChatroomChannel", mod_message: message_render(message) if message.save
  end

  private
  def whitelisted_messages
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message} )
  end

end