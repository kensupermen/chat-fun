class UsersController < ApplicationController

  def index
    @users = User.all.where.not(id: session[:user_id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params 
    if @user.persisted?
      session[:user_id] = @user.id
      flash[:success] = "Registered successfully"
      redirect_to root_path
    else
      flash.now[:error] = "Error: #{@user.errors.full_messages.to_s}"
      render 'new'
    end
  end

  def send_friend_request
    if current_user.send_friend_request(params[:friend_id])
      flash[:success] = "Sent friend request."
    end
    redirect_to users_path
  end

  def accept_friend_request
    if current_user.accept_friend_request(params[:friend_id]) 
      flash[:success] = "Accepted request"
    end
    redirect_to users_path
  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
