  class MessagesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  def new
  	@user=User.find(params[:message][:message_to])
  	@m=current_user

  	@message=Message.new
  end
  def index
  	@messages=Message.all
  end
  def create
  	@message=current_user.messages.create(message_params)
  	@message.save
    
      @user=User.find(current_user.id)
      @user2=User.find_by(email:@message.message_to)
    
      @notification=Notification.create(recipient:@user2,actor:@user,action:@message.message_content,notifiable:@message)
      @notification.save

  	redirect_to root_path	
  end
  def edit
  end
  def destroy
    @message=Message.find(params[:id])
    @message.destroy
   redirect_to root_path
  end
  def show
  end
  private
  def message_params
    params.require(:message).permit(:message_to,:message_from,:message_content) 
  end 
end
