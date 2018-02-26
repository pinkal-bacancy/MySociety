class StatusesController < ApplicationController
  def new
  	@status =Status.new
    $maintainance=Maintainance.find(params[:maintainance_id])    
  end
  def create
    maintainance= $maintainance
    @society=maintainance.society
    @users=@society.users
  
    @users.each do |u|
      @status=Status.create(user_id: u.id,maintainance_id:maintainance.id,maintainance_status:"pending")
      @status.save   		
    end
    redirect_to maintainances_path
  end

  def index
  	@statuses=Status.all
  end
  def edit_status
    @status=Status.find(params[:id])
    if @status.maintainance_status=="pending"
    @status.maintainance_status="paid"
    else
       @status.maintainance_status="pending"
     end
    @status.save
    redirect_to statuses_path
  end
  def show
  end
  def edit
  end
end
