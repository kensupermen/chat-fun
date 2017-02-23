class MessagesController < ApplicationController
  def index
    @messages = current_user.lastest_received_messages(10)
  end


  def new 
    @message = Message.new
    @friend_lists = Relationship.where(user_id: current_user.id, status: "accepted").or(Relationship.where(friend_id: current_user.id, status: "accepted"))
  end

  def create
    Message.create sender: current_user, recipient: User.find_by(id: message_params[:recipient]), body: message_params[:body]
    flash[:success] = "Sent success"
    redirect_to new_message_path
  end
  
  def sent_messages
    @messages = current_user.lastest_sent_messages(10)
    render 'sent_messages'
  end

  private
  def message_params
    params.require(:message).permit(:body, :recipient)
  end

end
