class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.build(whitelisted_messages)
    redirect_to root_path if message.save
  end

  private
  def whitelisted_messages
    params.require(:message).permit(:body)
  end
end