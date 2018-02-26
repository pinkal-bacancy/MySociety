class MaintainancesController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource 
  def new
  	@maintainance=Maintainance.new
  end
  def create
    @society=current_user.society
    @maintainance=@society.maintainances.create(maintainance_params)
    @maintainance.save
    redirect_to new_status_path(maintainance_id: @maintainance.id)
  end

  def index
  	@users=User.where(society_id: current_user.society_id)
     
  	@maintainances=Maintainance.all
    

  end
  def destroy
    @maintainance=Maintainance.find(params[:id])
    @maintainance.destroy
 
   redirect_to maintainances_path

  end

  def show
  end

  def edit
  end
  private
  def maintainance_params
    params.require(:maintainance).permit(:month,:amount,:due_date)
  end
end
