class SocietiesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource 
  def new
    @society=Society.new
  end
  def create
    @society=Society.new(society_params)
    @society.save
    redirect_to societies_path
  end
  def add
   # @users=User.all
   @events=Event.all
   @messages =Message.all
   @soc=Society.search(params[:search])
   @users=User.where(society_id: @soc.ids)
  end
  def index
    @societies=Society.all
  end
  def edit
    @society=Society.find(params[:id])
  end
  def update
    @society = Society.find(params[:id])
    if @society.update(society_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @society=Society.find(params[:id])
    @society.destroy
    redirect_to societies_path
  end

  private
  def society_params
    params.require(:society).permit(:society_name, :address, :contry,:city,:state,:zipcode,:street_name,:search) 
  end
end
