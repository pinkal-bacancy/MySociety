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
