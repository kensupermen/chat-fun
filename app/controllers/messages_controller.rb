class MessagesController < ApplicationController
  def index
    @messages = current_user.lastest_received_messages(10)
  end
end
