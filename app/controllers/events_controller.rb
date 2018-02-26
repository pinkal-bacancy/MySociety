class EventsController < ApplicationController
	before_action :authenticate_user!
  load_and_authorize_resource except: [:index]
  def new
  	@event=Event.new
  end
  def create
    @society=current_user.society
    @event=@society.events.create(event_params)
    @event.save
    redirect_to events_path
  end

  def index
  	@events =Event.where('event_date >= ?',Date.today)
  end

  def show
  end
  def destroy
    @event=Event.find(params[:id])
    @event.destroy
 
   redirect_to events_path

  end

  def edit
    @event=Event.find(params[:id])
  end
  def update
    @event = Event.find(params[:id])
 
    if @event.update(event_params)
      redirect_to events_path
    else
      render 'edit'
    end
  end
  private
  def event_params
    params.require(:event).permit(:event_title,:event_date,:event_description) 
  end
end
