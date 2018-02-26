class ComplaintsController < ApplicationController
  load_and_authorize_resource
  def new
    @complaint=Complaint.new
  end

  def create
    @complaint=Complaint.new(complaint_params)
    @complaint.user_id=current_user.id
    @complaint.status="pending"
    @complaint.save
    redirect_to root_path
  end

  def edit_status
    @complaint=Complaint.find(params[:id])
    @complaint.status="solved"
    @complaint.save
    @message=current_user.messages.create(message_to: @complaint.user.email,message_from:current_user.name,message_content:"complaint solved" )
    @message.save
    redirect_to root_path
  end

  def index
    @complaints=Complaint.all
  end

  def show
  end
  def destroy
    @complaint=Complaint.find(params[:id])
    @complaint.destroy
    redirect_to root_path
  end

  def edit
  end
  
  private
  def complaint_params
    params.require(:complaint).permit(:content,:user_id,:status)
  end
end
