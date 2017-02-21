class MessagesController < ApplicationController
  def index
    @messages = current_user.received_messages.order('created_at DESC')
  end
end
